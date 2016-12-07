var express = require('express');
var router = express.Router();

var pgp = require('pg-promise')();

var edca_db;

if ( typeof process.env.EDCA_DB != "undefined" ){
    console.log("EDCA_DB: ", process.env.EDCA_DB);
    edca_db = pgp( process.env.EDCA_DB );
} else {
    console.log("Warning: EDCA_DB env variable is not set\n " +
        " defaulting to -> postgres://tester:test@localhost/edca");
    edca_db = pgp("postgres://tester:test@localhost/edca");
}

/* GET home page. */
router.get('/', function(req, res, next) {

    edca_db.task(function (t) {
        return this.batch([
        this.one('select count (*)  as total from (select distinct identifier_id  from supplier) as t ;'),
        this.one('select count (*) as total from contractingprocess'),
        this.one('select count (*) as total from contract where value_amount > 0 '),
        this.one('select sum(value_amount) as total from contract')
        ]);
    }).then(function (data) {
        res.render('index',{ title: 'Contrataciones Abiertas',
            metadata : {
                supplier_count: data[0].total,
                cp_count: data[1].total,
                contract_count: data[2].total,
                contract_value_amount_total: data[3].total
            }
        });
    }).catch(function (error) {
        console.log("ERROR: ", error);
    });

});

/* dashboard contract list (1st page) */
router.get('/contratos/',function (req, res) {
    edca_db.task(function (t) {
        return this.batch([
            this.one('select count (*)  as total from (select distinct identifier_id  from supplier) as t ;'),
            this.one('select count (*) as total from contractingprocess'),
            this.one('select count (*) as total from contract where value_amount > 0'),
            this.one('select sum(value_amount) as total from contract'),
            this.manyOrNone("select tender.procurementmethod, sum (contract.value_amount) as total , count(*) as conteo from contract, tender " +
                "where contract.contractingprocess_id=tender.contractingprocess_id group by tender.procurementmethod order by tender.procurementmethod"),
            this.manyOrNone("select destino, sum(contract.value_amount) as total_amount, count(*) as conteo from contract, contractingprocess " +
                "where contract.contractingprocess_id= contractingprocess.id group by destino order by destino;")
        ]);
    }).then(function (data) {
        res.render('dashboard',{ title: 'Contrataciones Abiertas',
            metadata : {
                supplier_count: +data[0].total,
                cp_count: +data[1].total,
                contract_count: +data[2].total,
                contract_value_amount_total: data[3].total,
                total_procedimiento: data[4],
                destinos : data[5]
            }
        });

    }).catch(function (error) {
        console.log("ERROR: ", error);
    });
});

//PAGINATION
router.post('/pagination', function (req, res) {
    //contracts per page
    var limit = 10;

    var npage = 1;
    if ( !isNaN( +(req.body.npage) )){
        npage = Math.abs(req.body.npage);
    }

    edca_db.task(function (t) {

        var q1, q2 ;

        if ( typeof req.body.keyword != 'undefined' && typeof req.body.orderby != 'undefined' && typeof req.body.orderby != 'undefined') {
            q1 = this.manyOrNone("select contractingprocess.id as localid, contractingprocess.ocid, contractingprocess.stage, contract.title," +
                "contract.datesigned, contract.value_amount, tender.procurementmethod, " +
                "(select count(*) as nsuppliers from supplier where supplier.contractingprocess_id = tender.contractingprocess_id )" +
                " from contract, tender, contractingprocess where contract.contractingprocess_id = tender.contractingprocess_id " +
                " and contract.contractingprocess_id = contractingprocess.id " +
                "and (contract.title ilike '%$1#%' or contract.contractid ilike '%$1#%') " +
                ( req.body.filter != 'Todo' ? " and tender.procurementmethod ilike '$2#%' " : "") +
                "order by $3~ "+(req.body.orderby == 'value_amount' || req.body.orderby == 'datesigned'?" desc ":"")+" limit $4 offset $5",
                [
                    req.body.keyword,
                    req.body.filter,
                    req.body.orderby,
                    limit,
                    ( +( npage ) -1 )* limit
                ]);
            q2 = this.one("select count(*) as total from contract, tender where contract.contractingprocess_id = tender.contractingprocess_id " +
            "and (contract.title ilike '%$1#%' or contract.contractid ilike '%$1#%') " +
            ( req.body.filter != 'Todo' ? " and tender.procurementmethod ilike '$2#%' " : ""),[
                req.body.keyword,
                req.body.filter
            ]);
        } else {
            q1 = this.manyOrNone('select contractingprocess.id as localid, contractingprocess.ocid, contractingprocess.stage, contract.title,' +
                'contract.datesigned, contract.value_amount, tender.procurementmethod,' +
                '(select count(*) as nsuppliers from supplier where supplier.contractingprocess_id = tender.contractingprocess_id )' +
                ' from tender, contract, contractingprocess ' +
                ' where tender.contractingprocess_id = contractingprocess.id and tender.contractingprocess_id = contract.contractingprocess_id order by contract.value_amount desc limit $1 offset $2',
                [
                    limit, ( +( npage ) -1 )* limit
                ]);
            q2 = this.one('select count (*) as total from contractingprocess');
        }


        return this.batch([
            q1,
            q2
        ]);

    }).then(function (data) {
        res.render('contracts',{
            contracts : data[0],
            cmetadata : {
                current_page: + npage,
                page_count: parseInt(( +data[1].total + +limit -1 ) / limit )
            }
        });

    }).catch(function (error) {
        res.send('ERROR');
        console.log("ERROR: ", error);
    });
});

/* GET contract details */
router.get('/contrato/:cpid/:stage',function (req, res) {
    var stage = req.params.stage ;

    var cpid = 1;

    if ( !isNaN( parseInt(req.params.cpid) )){
        cpid = Math.abs( req.params.cpid );
    }

    var qinfo = 'select tender.contractingprocess_id as cpid, tender.procurementmethod, contract.contractid, contract.title, contract.datesigned, contract.value_amount, ' +
        'contract.value_currency, contract.period_startdate, contract.period_enddate from tender, contract ' +
        'where tender.contractingprocess_id = contract.contractingprocess_id and contract.contractingprocess_id = $1 ';

    var q1 = 'select * from $1~ where contractingprocess_id = $2';

    switch ( stage ){
        case 'licitacion':
            edca_db.task( function (t) {
                return this.batch([
                    //información general
                    this.one(qinfo, [ cpid ]),
                    this.one( q1,[ 'buyer', cpid ]),
                    this.one(q1,[ 'tender', cpid ]),
                    this.manyOrNone(q1,[ 'tenderitem', cpid ]),
                    this.manyOrNone(q1,[ 'tendermilestone', cpid ]),
                    this.manyOrNone(q1,[ 'tenderdocuments', cpid ]),
                    this.manyOrNone(q1,[ 'tenderamendmentchanges', cpid ]),
                    this.oneOrNone("select * from contractingprocess where id = $1",[ cpid ])
                ]);
            }).then(function (data) {
                res.render('contract',{
                    current_stage: stage,
                    info: data[0],
                    buyer: data[1],
                    tender : data[2],
                    items: data[3],
                    milestones: data[4],
                    documents: data[5],
                    changes: data[6],
                    contractingprocess: data[7]
                });
            }).catch(function (error) {
                console.log("ERROR: ", error);
                res.render ('contract' );
            });
            break;
        case 'adjudicacion':
            edca_db.task( function (t) {
                return this.batch([
                    //información general
                    this.one(qinfo, [ cpid ]),
                    this.one(q1,[ 'buyer',cpid ]),
                    this.one(q1 ,[ 'award', cpid ]),
                    this.manyOrNone(q1 ,[ 'supplier', cpid ]),
                    this.manyOrNone(q1 ,[ 'awarditem', cpid ]),
                    this.manyOrNone(q1 ,[ 'awarddocuments', cpid ]),
                    this.manyOrNone(q1 ,[ 'awardamendmentchanges', cpid ]),
                    this.oneOrNone("select * from contractingprocess where id = $1",[ cpid ])
                ]);
            }).then(function (data) {
                res.render('contract',{
                    current_stage: stage,
                    info: data[0],
                    buyer: data[1],
                    award : data[2],
                    suppliers: data[3],
                    items: data[4],
                    documents: data[5],
                    changes: data[6],
                    contractingprocess: data[7]
                });
            }).catch(function (error) {
                console.log("ERROR: ", error);
                res.render ('contract' );
            });
            break;
        case 'contratacion':
            edca_db.task( function (t) {
                return this.batch([
                    //información general
                    this.one(qinfo, [ cpid ]),
                    this.one(q1,[ 'buyer', cpid ]),
                    this.one(q1 ,[ 'contract', cpid ]),
                    this.manyOrNone(q1 ,[ 'contractitem', cpid ]),
                    this.manyOrNone(q1 ,[ 'contractdocuments', cpid ]),
                    this.manyOrNone(q1 ,[ 'contractamendmentchanges', cpid ]),
                    this.oneOrNone("select * from contractingprocess where id = $1",[ cpid ])
                ]);
            }).then(function (data) {
                res.render('contract',{
                    current_stage: stage,
                    info: data[0],
                    buyer: data[1],
                    contract : data[2],
                    items : data[3],
                    documents : data[4],
                    changes : data[5],
                    contractingprocess : data[6]
                });
            }).catch(function (error) {
                console.log("ERROR: ", error);
                res.render ('contract' );
            });
            break;
        case 'implementacion':
            edca_db.task( function (t) {
                return this.batch([
                    //información general
                    this.one(qinfo, [ cpid ]),
                    this.one(q1,['buyer', cpid ]),
                    this.manyOrNone(q1, ['implementationtransactions', cpid ]),
                    this.manyOrNone(q1, ['implementationmilestone', cpid ]),
                    this.manyOrNone(q1, ['implementationdocuments', cpid ]),
                    this.oneOrNone("select * from contractingprocess where id = $1",[ cpid ])
                ]);
            }).then(function (data) {
                res.render('contract',{
                    current_stage: stage,
                    info: data[0],
                    buyer: data[1],
                    transactions: data[2],
                    milestones: data[3],
                    documents: data[4],
                    contractingprocess : data[5]
                });
            }).catch(function (error) {
                console.log("ERROR: ", error);
                res.render ('contract' );
            });
            break;
        default:
            edca_db.task( function (t) {
                return this.batch([
                    //información general
                    this.one(qinfo, [cpid]),
                    this.one(q1, ['buyer', cpid]),
                    this.one(q1 ,['budget', cpid]),
                    this.manyOrNone(q1,['planningdocuments', cpid]),
                    this.oneOrNone("select * from contractingprocess where id = $1",[ cpid ])
                ]);
            }).then(function (data) {
                res.render('contract',{
                    current_stage: stage,
                    info: data[0],
                    buyer: data[1],
                    budget : data[2],
                    documents: data[3],
                    contractingprocess: data[4]
                });
            }).catch(function (error) {
                console.log("ERROR: ", error);
                res.render ('error' ,{ message:'Proceso de contratación inexistente', error: error  });
            });
            break;
    }
});


/* supplier details & statistics */
router.get('/proveedor/:supplierid', function (req, res ) {
    edca_db.one(' select * from supplier where id = $1 ', [ req.params.supplierid] ).then(function (data) {
        res.render('supplier', { supplier : data});
    }).catch(function (error) {
        res.render ('supplier');
        console.log("ERROR: ",error)
    });
});

/* DATA */
router.post('/bubble-chart-data', function (req, res) {
    edca_db.manyOrNone("select tender.contractingprocess_id, concat (substring(contract.title from 0 for 79), '...') as title , contract.datesigned, (contract.period_enddate - contract.period_startdate) as vigencia," +
        " tender.procurementmethod, contract.value_amount from tender,contract where tender.contractingprocess_id = contract.contractingprocess_id  " +
        " and contract.period_startdate is not null and contract.period_enddate is not null and contract.datesigned is not null and tender.procurementmethod is not null "
        //+" order by  tender.procurementmethod"
        /*"union "+
        "select tender.contractingprocess_id, concat (substring(contract.title from 0 for 79), '...') as title , contract.datesigned, 0 as vigencia," +
        " tender.procurementmethod, contract.value_amount from tender,contract where tender.contractingprocess_id = contract.contractingprocess_id  " +
        " and (contract.period_startdate is null or contract.period_enddate is null) and contract.datesigned is not null and tender.procurementmethod is not null"*/
    ).then(function (data) {
        res.send(data);
    }).catch(function (error) {
        res.send(error);
        console.log("ERROR: ",error)
    });
});

router.post('/donut-chart-data', function (req, res) {
//    edca_db.many("select procurementmethod, count(*) from tender  where procurementmethod not like '' group by procurementmethod order by procurementmethod;").then(function (data) {
    edca_db.manyOrNone("select tender.procurementmethod, sum(contract.value_amount) from tender, contract  where  tender.contractingprocess_id= contract.contractingprocess_id " +
        "and tender.procurementmethod not like '' group by tender.procurementmethod order by tender.procurementmethod;").then(function (data) {
        res.json (data);
    }).catch(function (error) {
        console.log("ERROR: ", error)
    });
});


router.get('/donut-chart2-data', function ( req, res) {

    edca_db.manyOrNone("select destino, sum(contract.value_amount) as total_amount, " +
        "concat (trunc (sum (value_amount)/(select sum(value_amount) from contract) * 100 , 2),'%') as percentage " +
        "from contract, contractingprocess " +
        "where  contract.contractingprocess_id= contractingprocess.id group by destino;").then(function (data) {
        res.json(data);
    }).catch(function (error) {
        console.log(error);
    });

});



router.get('/d3-bubble-chart-data', function (req, res) {
    edca_db.manyOrNone("select supplier.identifier_id, supplier.identifier_legalname, contract.contractid, contract.title,tender.procurementmethod,"+
    "concat (cast (  ( DATE_PART('year', period_enddate) - DATE_PART('year', period_startdate) ) * 12  + ( DATE_PART('month', period_enddate) - DATE_PART('month', period_startdate))" +
        "  as integer) / 12 , ' año(s)') as vigencia, "+
        " contract.value_amount, contract.contractingprocess_id as cpid from tender, supplier, contract " +
        " where supplier.contractingprocess_id = contract.contractingprocess_id and supplier.contractingprocess_id = tender.contractingprocess_id "+
            " and ( contract.period_enddate is not null and contract.period_startdate is not null)"+
            " order by cast (  ( DATE_PART('year', period_enddate) - DATE_PART('year', period_startdate) ) * 12  + ( DATE_PART('month', period_enddate) - DATE_PART('month', period_startdate))" +
        "  as integer) / 12 ").then(function (data) {
        res.json(data);
    }).catch(function (error) {
        res.json(error);
    });
});




module.exports = router;
