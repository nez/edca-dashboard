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
router.get('/contratos/',function (req, res) {

    edca_db.task(function (t) {

        var q1 = this.many('select contract.contractingprocess_id, contract.id, contract.title, contract.contractid, ' +
            'contract.datesigned, contract.value_amount, tender.procurementmethod,' +
            '(select count(*) as nsuppliers from supplier where supplier.contractingprocess_id = tender.contractingprocess_id )' +
            ' from tender, contract ' +
            ' where tender.contractingprocess_id = contract.contractingprocess_id order by contract.title');

        var q2 = this.one('select count (*)  as total from (select distinct identifier_id  from supplier) as t ;');
        var q3 = this.one('select count (*) as total from contractingprocess');
        var q4 = this.one('select sum(value_amount) as total from contract');

        return this.batch([q1,q2, q3, q4]);
    }).then(function (data) {
        res.render('dashboard',{ title: 'Estandar de Datos de Contrataciones Abiertas',
            contracts : data[0],
            metadata : {
                supplier_count: data[1].total,
                contract_count: data[2].total,
                contract_value_amount_total: data[3].total
            }
        });
    }).catch(function (error) {
        console.log("ERROR: ", error);
    });
});


/* GET contract details */
router.get('/contrato/:cpid',function (req, res) {

    edca_db.task( function (t) {

        return this.batch([
            //información general
            this.one('select tender.contractingprocess_id as cpid, tender.procurementmethod, contract.contractid, contract.title, contract.datesigned, contract.value_amount, contract.value_currency, ' +
                'contract.period_startdate, contract.period_enddate from tender, contract ' +
                'where tender.contractingprocess_id = contract.contractingprocess_id and contract.contractingprocess_id = $1 ', [
                req.params.cpid
            ]),

            //planeación
            this.one("select * from planning where contractingprocess_id= $1 " ,[ req.params.cpid]),
            //licitación
            this.one("select * from tender where contractingprocess_id = $1 " ,[ req.params.cpid ]),
            //adjudicación
            this.one("select * from award where contractingprocess_id = $1" ,[ req.params.cpid ]),
            //contrato
            this.one (" select * from contract where contractingprocess_id =$1" , [ req.params.cpid]),
            //implementación -> transacciones
            this.manyOrNone(" select * from implementationtransactions where id =$1", [ req.params.cpid ]),
            //implementación -> documentos
            this.manyOrNone(" select * from implementationdocuments transactions where id =$1", [ req.params.cpid ]),
            //implementación -> hitos
            this.manyOrNone(" select * from implementationmilestone transactions where id =$1", [ req.params.cpid ])

        ]);

    }).then(function (data) {
        res.render('contract',{
            info: data[0],
            planning : data[1],
            tender: data[2],
            award: data[3],
            contract : data[4],
            imp_transactions : data[5],
            imp_documents : data[6],
            imp_milestones : data[7]
        });
    }).catch(function (error) {
        console.log("ERROR: ", error);
        res.render ('contract' );
    });
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
    edca_db.manyOrNone('select contract.title, contract.datesigned, (contract.period_enddate - contract.period_startdate) as vigencia,' +
        ' tender.procurementmethod, contract.value_amount from tender,contract where tender.contractingprocess_id = contract.contractingprocess_id  ').then(function (data) {
        res.send(data);
    }).catch(function (error) {
        res.send(error);
        console.log("ERROR: ",error)
    });
});

router.get('/donut-chart-data', function (req, res) {
    edca_db.many('select procurementmethod, count(*) from tender group by procurementmethod;').then(function (data) {
        res.json (data);
    }).catch(function (error) {
        console.log("ERROR: ", error)
    });
});


/**

router.get('/tree-chart-data/:cpid/:stage', function (req, res) {

    //transacciones
    function getTransactions( data ) {
        var transactions = [];
        for ( var i =0; i< data.length; i++){
            transactions.push ({
                "name": "Transacción",
                "text":"",
                "children": [
                    //{"name": "ID adjudicación","text":"LO-009KDH999-N50-2015"},
                    //{"name": "ID contrato","text":"LPN-OP-DCAGI-SC-076/15"},
                    { "name": "ID transacción","text": data.transactionid },
                    { "name": "Fuente","text": data.source },
                    { "name": "Fecha","text": data.implementation_date },
                    { "name": "Monto","text": data.value_amount },
                    { "name": "Emisor","text": data.providerorganization_legalname },
                    { "name": "Receptor","text": data.providerorganization_legalname }
                ]
            });
        }
        return transactions;
    }


    //documentos
    function getDocuments( data ) {
        var documents = [ ];
        for ( var i =0; i < data.length ; i++){
            documents.push({
                "name": "Documento",
                "text": data.documentid ,
                "children": [
                    {"name": "Título","text": data.title },
                    {"name": "Descripción","text": data.description},
                    {"name": "URL","text": data.url}
                ]

            });
        }
        if (documents.length > 0) {return documents;}
    }


    // hitos
    function getMilestones( data ) {
        var milestones = [];
        for (var i = 0; i < data.length; i++) {
            milestones.push({
                "name": data.milestoneid,
                "text": data.title,
                "children": [
                    {"name": "Descripción", "text": data.description}
                ]
            });
        }

        if (milestones.length > 0){return milestones;}
    }

    function getItems( data ) {
        var items = [ ];
        for ( var i =0; i < data.length ;i++) {
            items.push({
                "name": "Item",
                "text": "",
                "children": [
                    {"name": "ID", "text": data.itemid},
                    {"name": "Descripción", "text": data.description},
                    {"name": "Cantidad", "text": data.quantity}
                ]
            });
        }
        if (items.length > 0) {return items;}
    }

    // Amendment chages
    function getChanges( data ) {
        var changes = [ ];
        for ( var i=0; i < data.length; i++){
            changes.push({
                //???
            });
        }
        if (changes.length > 0){return changes;}
    }

    // Suppliers
    function getSuppliers( data ) {
        var suppliers = [ ];
        for (var i =0; i< data.length; i++){
            suppliers.push({
                //???
            });
        }

        if (suppliers.length > 0 ){return suppliers;}
    }
    
    switch ( req.params.stage ){
        case 'planning':

            edca_db.task(function (t) {
                var budget = this.one('select * from budget where contractingprocess_id = $1',[ req.params.cpid ]);
                var documents = this.manyOrNone('select * from planningdocuments where contractingprocess_id = $1',[ req.params.cpid ]);

                return this.batch([ budget, documents ]);
            }).then(function ( data ) {


                res.json({
                    "name": "Planeación",
                    "text":"",
                    "children": [
                        {
                            "name": "Presupuesto",
                            "text":"",
                            "children": [
                                { "name": "Fuente", "text": data[0].budget_source },
                                { "name": "ID", "text": data[0].budget_bugetid },
                                { "name": "Descripción", "text": data[0].budget_description },
                                { "name": "Total", "text": data[0].budget_amount },
                                { "name": "Proyecto presupuestario", "text": data[0].budget_project }
                            ]
                        },
                        {
                            "name":"Fundamento",
                            "text":'Dado que las precipitaciones locales escurrierón hacia las zonas más bajas del polígono, lo que antiguamente fuera el lago de Texcoco, durante la construcción del NAICM se requeririó; un drenaje pluvial provisional de funcionamiento temporal dentro del perímetro de la construcción, que permita asegurar la protección de dichas obras. Lo anterior, con el objetivo de asegurar que las zonas donde se esté desarrollando los trabajos permanezcan secas.'
                        },
                        // Planning documents
                        getDocuments( data[1])
                    ]
                });

            }).catch(function (error) {
                res.send(error);
                console.log(error);
            });
            break;
        case 'tender':

            edca_db.task(function (t) {
                var tender = this.one("select * from tender where contractingprocess_id = $1", [req.params.cpid ]);
                var documents = this.manyOrNone('select * from tenderdocuments where contractingprocess_id = $1', [ req.params.cpid ]);
                var milestones = this.manyOrNone('select * from tendermilestone where contractingprocess_id = $1', [ req.params.cpid ]);
                var changes = this.manyOrNone('select * from tenderamendmentchanges where contractingprocess_id = $1' ,[ req.params.cpid ]);
                var items = this.manyOrNone('select * from tenderitem where contractingprocess_id = $1 ' ,[ req.params.cpid ]);

                return this.batch( [ tender, documents, milestones, changes, items ] );
            }).then(function (data) {
                res.json({
                    "name": "Licitación",
                    "text":"",
                    "children": [
                        { "name": "ID","text": data[0].tenderid },
                        { "name": "Titulo", "text": data[0].title },
                        { "name": "Descripción","text": data[0].description },
                        { "name": "Estatus","text": data[0].status },
                        { "name": "Valor mínimo","text":"No aplica" },
                        { "name": "Valor","text": data[0].value_amount },
                        {
                            "name": "Método de adquisición","text": data[0].procurementmethod,
                            "children":[
                                {
                                    "name": "Carácter","text":"Nacional"
                                },
                                {
                                    "name": "Forma del proceso","text": data[0].submissionmethod
                                },
                                {
                                    "name": data[0].procurementmethod_rationale
                                }
                            ]
                        },
                        //Tender items
                        getItems(data[4]),
                        {
                            "name": "Criterio Adjudicación","text":"Puntos y Porcentajes",
                            "children":[
                                {"name":"Detalles","text":"1. EVALUACIÓN DE LA PROPUESTA TÉCNICA: I. CALIDAD DE LA OBRA.- (a) Que los materiales propuestos para la ejecución de los trabajos cumplan con los estándares de calidad y medidas ambientales. (3.0); (b) Mano de Obra. Que la mano de obra propuesta para la ejecución de los trabajos, cumpla con los requisitos administrativos y con las aptitudes establecidos (3.0); (c) Maquinaria y equipo. Que la maquinaria y vehículos propuestos para la ejecución de los trabajos cumplan con los estándares de calidad y medidas ambientales exigidas (5.0); (d) Esquema estructural de la organización de los profesionales técnicos que se encargarán de la dirección y coordinación de los trabajos. Que el esquema estructural de profesionales técnicos (organigrama) propuesto, es el adecuado, suficiente y necesario (0.5); (e) Procedimiento constructivo. Que las técnicas propuestas a utilizar para la ejecución de los trabajos, sean congruentes con las características, complejidad y magnitud de trabajos a ejecutar en el proyecto (5.0); (f) Programas. Que exista una congruencia entre los programas generales y específicos de la obra (1.5), y (g) Descripción de la planeación integral para la ejecución de los trabajos. Explicación detallada de los procesos que se utilizaran en la ejecución, desarrollo y organización de los trabajos (2.0). II. CAPACIDAD LICITANTE.- (a) Capacidad de los recursos humanos. Que el personal profesional técnico ha participado en por lo menos 5 proyectos similares al que se licita (5.0); (b) Capacidad de los recursos económicos. Serán los recursos económicos que se consideren necesarios para que el licitante cumpla con el contrato (4.0); (c) Participación de discapacitados o empresas que cuenten con trabajadores con discapacidad (0.5), y (d) Subcontratación de MIPYMES. Se otorgará al licitante el puntaje indicado; se verificará que la proposición que contenga la documentación con la cual demuestre que subcontratará MIPYMES (0.5). III. EXPERIENCIA Y ESPECIALIDAD.- (a) Experiencia. Se verificará que el licitante durante los últimos 10 años ha ejecutado obras similares a los que se licitan (7.0), y (b) Especialidad. Se verificará que dentro de los últimos 10 años, el licitante ha ejecutado por lo menos 5 obras con las características, complejidad y magnitud específicas y a los volúmenes y condiciones similares a las requeridas por la convocante (8.0). IV. CUMPLIMIENTO DE CONTRATOS.- (a) Cumplimiento de contratos. Se verificará que por lo menos 5 obras ejecutadas por el licitante en los últimos 10 años, se hayan terminado en tiempo y forma (5.0).   2. EVALUACIÓN DE LA PROPUESTA EÉ El total de pÉde la proposición económica, tendrá un valor numérico máximo de 50. Para llevar a cabo la evaluación de la propuesta económica, la convocante verificará que el análisis, cálculo e integración de los precios cumplan con la condición de pago establecida en la convocatoria o Licitación en términos del artículo 45 de la Ley y los artículos 45 y del 185 al 220"}
                            ]
                        },
                        {"name": "Método de recepción","text":"Presencial",
                            "children":[
                                {"name":"Detalles","text":"El acto de presentación y apertura de proposiciones se llevó a cabo a las 12:00 horas del 6 de agosto de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapan San Angel, Delegación Alvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Subdirector de Contrataciones de GACM.    Los documentos técnicos T.2 y T.3, así como la documentación económica E-10, correspondiente a las 32 proposiciones presentadas, fueron rubricados por los representantes de tres licitantes y un consorcio."}
                            ]
                        },
                        {"name": "Periodo recepción de propuestas","text":"08/06/2015"},
                        {"name": "Periodo aclaraciones","text":"",
                            "children":[{"name":"inicio","text":"07/03/2015"},
                                {"name":"fin","text":"07/22/2015"}]},
                        {"name": "Criterio de elegibilidad","text":"Numeral 2.10 de la Convocatoria"},
                        {"name": "Periodo adjudicación","text":"07/21/2015"},
                        {"name": "Tuvo aclaraciones","text":"371"},
                        {"name": "Tuvo testigo social","text":"1"},
                        {"name": "Testigo social","text":"",
                            "children":[{"name":"ID","text":"IMA941216HE8"},
                                {"name":"Nombre","text":"Instituto Mexicano de Auditoría Técnica, A. C."}]},
                        {"name": "Número de participantes","text":"32"},
                        {"name": "Entidad que contrata", "text":"Grupo Aeroportuario de la Ciudad de México, S.A. de C.V."},

                        // Tender documents
                        getDocuments(data[1]),
                        // Tender milestones
                        getMilestones(data[2]),
                        // Tender amendment changes
                        getChanges(data[3])
                    ]
                });

            }).catch(function (error) {
                res.send(error);
                console.log (error);
            });

            break;
        case 'award':

            edca_db.task(function (t) {
                var award = this.one('select * from award where contractingprocess_id=$1',[req.params.cpid]);
                var suppliers = this.manyOrNone('select * from supplier where contractingprocess_id = $1',[ req.params.cpid ]);
                var documents = this.manyOrNone('select * from awarddocuments where contractingprocess_id = $1', [ req.params.cpid ]);
                var items = this.manyOrNone('select * from awarditem where contractingprocess_id = $1', [ req.params.cpid ]);
                var changes = this.manyOrNone('select * from awardamendmentchanges where contractingprocess_id = $1 ', [ req.params.cpid ]);

                return this.batch([ award, suppliers, documents, items, changes ]);

            }).then(function (data) {

                res.json( {
                    "name": "Adjudicación",
                    "text":"",
                    "children": [

                        { "name": "ID adjudicación","text": data[0].awardid },
                        { "name": "Título", "text": data[0].title },
                        { "name": "Descripción","text": data[0].description },
                        { "name": "Estatus","text": data[0].status },
                        { "name": "Fecha","text": data[0].award_date },
                        { "name": "Valor","text": data[0].value_amount },
                        { "name": "Inconformidades recibidas","text":"0" },
                        // Suppliers
                        getSuppliers ( data[1]),
                        // Award documents
                        getDocuments(data[2]),
                        // Award items
                        getItems(data[3]),
                        // Award amendment changes
                        getChanges (data[4])
                    ]
                });

            }).catch(function (error) {
                res.send(error);
                console.log(error)
            });

            break;
        case 'contract':

            edca_db.task(function (t) {
                var contract = this.one("select * from contract where contractingprocess_id = $1 ", [req.params.cpid]);
                var items = this.manyOrNone('select * from contractitem where contractingprocess_id  =$1',[ req.params.cpid ]);
                var documents = this.manyOrNone('select * from contractdocuments where contractingprocess_id = $1', [ req.params.cpid ]);
                var changes = this.manyOrNone('select * from contractamendmentchanges where contractingprocess_id = $1', [ req.params.cpid ]);

                return this.batch( [ contract, items, documents, changes ] );
            }).then(function (data) {

                res.json({
                    "name": "Contratación",
                    "text":"",
                    "children": [
                        { "name": "ID adjudicación","text": data[0].awardid },
                        { "name": "ID contrato","text": data[0].contractid },
                        { "name": "Título","text": data[0].title },
                        { "name": "Descripción","text": data[0].description },
                        { "name": "Estatus","text": data[0].status },
                        { "name": "Periodo","text":"","children":[
                            {
                                "name":"Inicio","text": data[0].period_startdate//"10/09/2015"
                            },
                            {
                                "name":"Fin","text": data[0].period_enddate//"03/07/2016"
                            }
                        ]
                        },
                        {
                            "name": "Valor","text": data[0].value_amount//"192525597.09"
                        },
                        {
                            "name": "Fecha de firma","text": data[0].datesigned //"10/09/2015"
                        },

                        // Contract items
                        getItems(data[1]),

                        // Contract documents
                        getDocuments(data[2]),

                        // Contract amendment changes
                        getChanges(data[3])
                    ]
                });

            }).catch(function (error) {
                console.log(error);
            });

            break;
        case 'implementation':

            edca_db.task(function (t) {

                var transactions = this.manyOrNone('select * from implementationtransactions where contractingprocess_id = $1', [ req.params.cpid ]);
                var milestones = this.manyOrNone('select * from implementationmilestone where contractingprocess_id = $1', [ req.params.cpid ]);
                var documents = this.manyOrNone(' select * from implementationdocuments where contractingprocess_id = $1', [ req.params.cpid ]);

                return this.batch([ transactions, documents, milestones ]);

            }).then(function(data){

                res.json ({
                    "name": "Implementación",
                    "text":"",
                    "children": [ getTransactions(data[0]), getDocuments(data[1]),getMilestones(data[2]) ]
                });

            }).catch(function (error) {
                console.log(error);
            });
            break;
        default:
            edca_db.task( function (t){
                var q1 = "";
                return this.batch( [ q1 ]);
            }).then(function () {
                res.json({});
            }).catch(function ( error ) {
                res.send(error);
            });
            break;
    }
});**/

module.exports = router;
