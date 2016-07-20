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
        var q1 = this.one('select count (*)  as total from (select distinct identifier_id  from supplier) as t ;');
        var q2 = this.one('select count (*) as total from contractingprocess');
        var q3 = this.one('select sum(value_amount) as total from contract');

        return this.batch([q1,q2, q3]);
    }).then(function (data) {
        res.render('index',{ title: 'Estandar de Datos de Contrataciones Abiertas',
            metadata : {
                supplier_count: data[0].total,
                contract_count: data[1].total,
                contract_value_amount_total: data[2].total
            }
        });
    }).catch(function (error) {
        console.log("ERROR: ", error);
    });

    //res.render('index',{ title: 'Estandar de Datos de Contrataciones Abiertas'});
});

/* dashboard contract list (1st page) */
router.get('/contratos/:npage',function (req, res) {

    //contracts per page
    var limit = 10;

    var npage = 1;
    if ( !isNaN( +(req.params.npage) )){
        npage = Math.abs(req.params.npage);
    }

    edca_db.task(function (t) {

        return this.batch([
            this.manyOrNone('select contract.contractingprocess_id, contract.id, contract.title, contract.contractid, ' +
                'contract.datesigned, contract.value_amount, tender.procurementmethod,' +
                '(select count(*) as nsuppliers from supplier where supplier.contractingprocess_id = tender.contractingprocess_id )' +
                ' from tender, contract ' +
                ' where tender.contractingprocess_id = contract.contractingprocess_id order by contract.title limit $1 offset $2',
                [
                    limit, ( +( npage ) -1 )* limit
                ]),

            this.one('select count (*)  as total from (select distinct identifier_id  from supplier) as t ;'),
            this.one('select count (*) as total from contractingprocess'),
            this.one('select sum(value_amount) as total from contract')
        ]);

        // return this.batch([q1,q2, q3, q4]);
    }).then(function (data) {
        res.render('dashboard',{ title: 'Estandar de Datos de Contrataciones Abiertas',
            contracts : data[0],
            metadata : {
                supplier_count: +data[1].total,
                contract_count: +data[2].total,
                contract_value_amount_total: data[3].total,
                current_page: + npage,
                page_count: parseInt(( +data[2].total + +limit -1 ) / limit )
            }
        });


    }).catch(function (error) {
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
                    this.one(q1,[ 'tender', cpid ])
                ]);
            }).then(function (data) {
                res.render('contract',{
                    current_stage: stage,
                    info: data[0],
                    buyer: data[1],
                    tender : data[2]
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
                    this.one(q1 ,[ 'award', cpid ])
                ]);
            }).then(function (data) {
                res.render('contract',{
                    current_stage: stage,
                    info: data[0],
                    buyer: data[1],
                    award : data[2]
                });
            }).catch(function (error) {
                console.log("ERROR: ", error);
                res.render ('contract' );
            });
            break;
        case 'contrato':
            edca_db.task( function (t) {
                return this.batch([
                    //información general
                    this.one(qinfo, [ cpid ]),
                    this.one(q1,[ 'buyer', cpid ]),
                    this.one(q1 ,[ 'contract', cpid ])
                ]);
            }).then(function (data) {
                res.render('contract',{
                    current_stage: stage,
                    info: data[0],
                    buyer: data[1],
                    contract : data[2]
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
                    this.manyOrNone(q1, ['implementationtransactions', cpid ])
                ]);
            }).then(function (data) {
                res.render('contract',{
                    current_stage: stage,
                    info: data[0],
                    buyer: data[1],
                    transactions: data[2]
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
                    this.one(q1 ,['budget', cpid])
                ]);
            }).then(function (data) {
                res.render('contract',{
                    current_stage: stage,
                    info: data[0],
                    buyer: data[1],
                    budget : data[2]
                });
            }).catch(function (error) {
                console.log("ERROR: ", error);
                res.render ('error' ,{ message:'Proceso de contratación inexistente', error: error  });
            });
            break;
    }
});

/* buyer details (per contract)*/
router.get('/contrato/:cpid/entidad-compradora/', function (req, res ) {
    edca_db.one('select * from buyer where id = $1 ',[ Number(req.params.cpid) ]).then(function(data){
        res.render('contractingprocess_buyer', { buyer : data});
    }).catch(function (error) {
        res.render('contractingprocess_buyer');
        console.log("ERROR: ", error);
    });
});

/* suppliers (per contract) */
router.get('/contrato/:cpid/proveedores', function (req, res ) {
    edca_db.manyOrNone('Select * from supplier where contractingprocess_id = $1 ',[ Number(req.params.cpid) ]).then(function (data) {
        res.render('contractingprocess_suppliers', { suppliers : data});
    }).catch(function (error) {
        res.render('contractingprocess_suppliers');
        console.log("ERROR: ", error);
    });
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
/* find contract */
router.post ('/find-contracts/', function (req, res ) {

    edca_db.manyOrNone("select contract.contractingprocess_id, contract.id, contract.title, contract.contractid," +
        "contract.datesigned, contract.value_amount, tender.procurementmethod, " +
        "(select count(*) as nsuppliers from supplier where supplier. contractingprocess_id = tender.contractingprocess_id )" +
        " from contract, tender where contract.contractingprocess_id = tender.contractingprocess_id " +
        "and (contract.title ilike '%$1#%' or contract.contractid ilike '%$1#%') " +
        ( req.body.filter != 'Todo'?" and tender.procurementmethod ilike '$3#%' ":"")+
        "order by $2~", [req.body.keyword, req.body.orderby, req.body.filter]).then(function (data) {
        res.render (  'contracts', {contracts: data });
    }).catch(function (error) {
        console.log("ERROR: ", error); 
    });

});

router.get('/bubble-chart-data', function (req, res) {
    edca_db.manyOrNone("select concat (substring(contract.title from 0 for 79), '...') as title , contract.datesigned, (contract.period_enddate - contract.period_startdate) as vigencia," +
        " tender.procurementmethod, contract.value_amount from tender,contract where tender.contractingprocess_id = contract.contractingprocess_id  " +
        " and contract.period_startdate is not null and contract.period_enddate is not null and contract.datesigned is not null and tender.procurementmethod not like ''").then(function (data) {
        res.send(data);
    }).catch(function (error) {
        res.send(error);
        console.log("ERROR: ",error)
    });
});

router.get('/donut-chart-data', function (req, res) {
    edca_db.many("select procurementmethod, count(*) from tender  where procurementmethod not like '' group by procurementmethod order by procurementmethod;").then(function (data) {
        res.json (data);
    }).catch(function (error) {
        console.log("ERROR: ", error)
    });
});

module.exports = router;
