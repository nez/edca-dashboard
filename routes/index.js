var express = require('express');
var router = express.Router();

var pgp = require('pg-promise')();
var edca_db  = pgp("postgres://tester:test@localhost/edca");

/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('index', { title: 'Estandar de Datos de Contrataciones Abiertas' });
});


/* dashboard contract list (1st page) */
router.get('/contratos/',function (req, res) {

    edca_db.tx(function (t) {
        var q1 = this.many('select * from contract order by title');
        var q2 = this.many('select * from supplier');
        var q3 = this.one('select count (*)  as total from (select distinct identifier_id  from supplier) as t ;');
        var q4 = this.one('select count (*) as total from contractingprocess');
        var q5 = this.one('select sum(value_amount) as total from contract');

        return this.batch([q1,q2, q3, q4, q5]);
    }).then(function (data) {
        res.render('dashboard',{ title: 'Estandar de Datos de Contrataciones Abiertas',
            contracts : data[0],
            suppliers: data [1],
            metadata : {
                supplier_count: data[2].total,
                contract_count: data[3].total,
                contract_value_amount_total: data [4].total
            }
        });
    }).catch(function (error) {
        console.log("ERROR: ", error);
    });
});

/* GET contract details */
router.get('/contrato/:cpid',function (req, res) {
    edca_db.one('select tender.contractingprocess_id as cpid, tender.procurementmethod, contract.contractid, contract.title, contract.datesigned, contract.value_amount, contract.value_currency, ' +
        'contract.period_startdate, contract.period_enddate from tender, contract ' +
        'where tender.contractingprocess_id = contract.contractingprocess_id and contract.contractingprocess_id = $1 ', [
        req.params.cpid
    ]).then(function (data) {
        res.render('tree',{  contract : data });

    }).catch(function (error) {
        console.log("ERROR: ", error);
        res.render ('tree' );
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
    edca_db.tx(function (t) {

        var q1;
        console.log(req.body.filter);
        switch ( req.body.filter ) {
            case 'LP':
                q1 = this.manyOrNone("select * from contract where (title ilike '%$1#%' or contractid ilike '%$1#%') and contractid ilike 'LP%' order by $2~", [req.body.keyword, req.body.orderby]);
                break;
            case 'ITP':
                q1 = this.manyOrNone("select * from contract where (title ilike '%$1#%' or contractid ilike '%$1#%') and contractid ilike 'ITP%' order by $2~", [req.body.keyword, req.body.orderby]);
                break;
            case 'AD':
                q1 = this.manyOrNone("select * from contract where (title ilike '%$1#%' or contractid ilike '%$1#%') and contractid ilike 'AD%' order by $2~", [req.body.keyword, req.body.orderby]);
                break;
            default:
                q1 = this.manyOrNone("select * from contract where title ilike '%$1#%' or contractid ilike '%$1#%' order by $2~", [req.body.keyword, req.body.orderby]);
                break;
        }

        var q2 = this.manyOrNone("select * from supplier"); //hacer join suppliers -> contracts

        return this.batch([q1, q2]);
    }).then(function (data) {
        res.render (  'contracts', {contracts: data[0], suppliers: data[1] });
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

router.get('/tree-chart-data/:cpid/:stage', function (req, res) {

    /* case ...*/
    switch ( req.params.stage ){
        case 'planning':
            edca_db.tx(function (t) {
                var q1 = this.one('select * from budget where contractingprocess_id = $1',[ req.params.cpid ]);
                var q2 = this.manyOrNone('select * from planningdocuments where contractingprocess_id = $1',[ req.params.cpid ]);
                return this.batch([ q1, q2 ]);
            }).then(function ( data ) {


                res.json({
                    "name": "Planeación",
                    "text":"",
                    "children": [
                        {
                            "name": "Presupuesto",
                            "text":"",
                            "children": [
                                {
                                    "name": "Fuente",
                                    "text": data[0].budget_source
                                },
                                {
                                    "name": "ID",
                                    "text": data[0].budget_bugetid
                                },
                                {
                                    "name": "Descripción",
                                    "text": data[0].budget_description
                                },
                                {
                                    "name": "Total",
                                    "text": data[0].budget_amount
                                },
                                {
                                    "name": "Proyecto presupuestario",
                                    "text": data[0].budget_project
                                }
                            ]
                        },
                        {
                            "name":"Fundamento",
                            "text":'Dado que las precipitaciones locales escurrierón hacia las zonas más bajas del polígono, lo que antiguamente fuera el lago de Texcoco, durante la construcción del NAICM se requeririó; un drenaje pluvial provisional de funcionamiento temporal dentro del perímetro de la construcción, que permita asegurar la protección de dichas obras. Lo anterior, con el objetivo de asegurar que las zonas donde se esté desarrollando los trabajos permanezcan secas.'
                        },
                        {
                            "name": "Documentos",
                            "text":"",
                            "children": [
                                {"name": "Estudio factibilidad", "text":"Factibilidad técnica, legal y ambiental del proyecto de desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México"},
                                {"name": "Evaluación necesidades", "text":"Términos de referencia para la construcción del drenaje pluvial temporal para la protección de la zona durante la construcción de la primera fase del NAICM publicados en CompraNet el 24 de junio de 2015"},
                                {"name": "Estudio mercado", "text":"No aplica"}
                            ]
                        }
                    ]
                });




            }).catch(function (error) {
                res.send(error);
                console.log(error);
            });
            break;
        case 'tender':
            res.json({
                "name": "Licitación",
                "text":"",
                "children": [
                    {"name": "ID","text":"838749"},
                    {"name": "Titulo","text":"Para los trabajos relativos a la construcción del drenaje pluvial temporal"},
                    {"name": "Descripción","text":"Licitación Pública Nacional que tuvo por objeto la adjudicación del contrato para los trabajos relativos a la construcción del drenaje pluvial temporal del Nuevo Aeropuerto de la Ciudad de México."},
                    {"name": "Estatus","text":"Adjudicado"},
                    {"name": "Valor mínimo","text":"No aplica"},
                    {"name": "Valor","text":"490,000,000.00"},
                    {"name": "Método de adquisición","text":"Licitación Pública",
                        "children":[
                            {"name": "Carácter","text":"Nacional"},
                            {"name": "Forma del proceso","text":"Presencial"},
                            {"name":"Fundamento","text":"Artículo 27, segundo párrafo de la Ley de Obras Públicas y Servicios Relacionados con las Mismas"}
                        ]},
                    {"name": "Item","text":"",
                        "children":[
                            {"name":"Clasificación","text":"62501001"},
                            {"name":"Cantidad","text":"1"},
                            {"name":"Unidad","text":"Obra"}
                        ]},
                    {"name": "Criterio Adjudicación","text":"Puntos y Porcentajes",
                        "children":[{"name":"Detalles","text":"1. EVALUACIÓN DE LA PROPUESTA TÉCNICA: I. CALIDAD DE LA OBRA.- (a) Que los materiales propuestos para la ejecución de los trabajos cumplan con los estándares de calidad y medidas ambientales. (3.0); (b) Mano de Obra. Que la mano de obra propuesta para la ejecución de los trabajos, cumpla con los requisitos administrativos y con las aptitudes establecidos (3.0); (c) Maquinaria y equipo. Que la maquinaria y vehículos propuestos para la ejecución de los trabajos cumplan con los estándares de calidad y medidas ambientales exigidas (5.0); (d) Esquema estructural de la organización de los profesionales técnicos que se encargarán de la dirección y coordinación de los trabajos. Que el esquema estructural de profesionales técnicos (organigrama) propuesto, es el adecuado, suficiente y necesario (0.5); (e) Procedimiento constructivo. Que las técnicas propuestas a utilizar para la ejecución de los trabajos, sean congruentes con las características, complejidad y magnitud de trabajos a ejecutar en el proyecto (5.0); (f) Programas. Que exista una congruencia entre los programas generales y específicos de la obra (1.5), y (g) Descripción de la planeación integral para la ejecución de los trabajos. Explicación detallada de los procesos que se utilizaran en la ejecución, desarrollo y organización de los trabajos (2.0). II. CAPACIDAD LICITANTE.- (a) Capacidad de los recursos humanos. Que el personal profesional técnico ha participado en por lo menos 5 proyectos similares al que se licita (5.0); (b) Capacidad de los recursos económicos. Serán los recursos económicos que se consideren necesarios para que el licitante cumpla con el contrato (4.0); (c) Participación de discapacitados o empresas que cuenten con trabajadores con discapacidad (0.5), y (d) Subcontratación de MIPYMES. Se otorgará al licitante el puntaje indicado; se verificará que la proposición que contenga la documentación con la cual demuestre que subcontratará MIPYMES (0.5). III. EXPERIENCIA Y ESPECIALIDAD.- (a) Experiencia. Se verificará que el licitante durante los últimos 10 años ha ejecutado obras similares a los que se licitan (7.0), y (b) Especialidad. Se verificará que dentro de los últimos 10 años, el licitante ha ejecutado por lo menos 5 obras con las características, complejidad y magnitud específicas y a los volúmenes y condiciones similares a las requeridas por la convocante (8.0). IV. CUMPLIMIENTO DE CONTRATOS.- (a) Cumplimiento de contratos. Se verificará que por lo menos 5 obras ejecutadas por el licitante en los últimos 10 años, se hayan terminado en tiempo y forma (5.0).   2. EVALUACIÓN DE LA PROPUESTA EÉ El total de pÉde la proposición económica, tendrá un valor numérico máximo de 50. Para llevar a cabo la evaluación de la propuesta económica, la convocante verificará que el análisis, cálculo e integración de los precios cumplan con la condición de pago establecida en la convocatoria o Licitación en términos del artículo 45 de la Ley y los artículos 45 y del 185 al 220"}]},
                    {"name": "Método de recepción","text":"Presencial",
                        "children":[{"name":"Detalles","text":"El acto de presentación y apertura de proposiciones se llevó a cabo a las 12:00 horas del 6 de agosto de 2015, en la sala de juntas ubicada en Av. Insurgentes Sur 2453, piso 2, Torre Murano, Colonia Tizapan San Angel, Delegación Alvaro Obregón, México, D.F., C.P. 01090. El acto fue presidido por el Subdirector de Contrataciones de GACM.    Los documentos técnicos T.2 y T.3, así como la documentación económica E-10, correspondiente a las 32 proposiciones presentadas, fueron rubricados por los representantes de tres licitantes y un consorcio."}]
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
                    {
                        "name": "Documents",
                        "text":"",
                        "children": [
                            {"name": "Aviso de licitación","text":"Convocatoria a la Licitación Pública Nacional Presencial LO-009KDH999-N50-2015 para los trabajos relativos a la construcción del drenaje pluvial temporal del Nuevo Aeropuerto Internacional de la Ciudad de México publicada en CompraNet el 24 de junio de 2015"},
                            {"name": "Aviso de audiencia pública","text":"Proyecto de Convocatoria a la Licitación Pública Nacional Presencial para los trabajos relativos al drenaje pluvial temporal del Nuevo Aeropuerto Internacional de la Ciudad de México publicado en CompraNet el 3 de junio de 2015"},
                            {"name": "Especificaciones técnicas","text":"Términos de Referencia de la Licitación Pública Nacional Presencial LO-009KDH999-N50-2015 para los trabajos relativos a la construcción del drenaje pluvial temporal del Nuevo Aeropuerto Internacional de la Ciudad de México publicada en CompraNet el 24 de junio de 2015"},
                            {"name": "Conflictos de interés","text":"Formato de declaración de no conflicto de interés debidamente requisitado y firmado por cada uno de los servidores públicos que participan en el procedimiento de contratación"},
                            {"name": "Inhabilitaciones","text":"Directorio de proveedores y contratistas sancionados de la SFP"},
                            {"name": "Pre-selección de participantes","text":"No aplica para procedimientos realizados bajo la Ley de Obras Públicas y Servicios Relacionados con las Mismas"},
                            {"name": "Criterios evaluación","text":"Secciones 2.13 y 2.14 de la Convocatoria a la Licitación Pública Nacional Presencial LO-009KDH999-N50-2015 para los trabajos relativos a la construcción del drenaje pluvial temporal del Nuevo Aeropuerto Internacional de la Ciudad de México publicada en CompraNet el 24 de junio de 2015"},
                            {"name": "Información de participantes","text":"No aplica"},
                            {"name": "Criterios de elegibilidad","text":"Convocatoria a la Licitación Pública Nacional Presencial LO-009KDH999-N50-2015 para los trabajos relativos a la construcción del drenaje pluvial temporal del Nuevo Aeropuerto Internacional de la Ciudad de México publicada en CompraNet el 24 de junio de 2015"}
                        ]
                    },
                    {
                        "name": "Hitos",
                        "text":"",
                        "children": [
                            {"name": "Nombre","text":"Visita al sitio de realización de los trabajos relativos a la construcción del drenaje pluvial temporal del Nuevo Aeropuerto de la Ciudad de México"},
                            {"name":"Descripción","text":"La visita al sitio de realización de los trabajos relativos a la construcción del drenaje pluvial temporal del Nuevo Aeropuerto de la Ciudad de México dio inicio a las 10:00 horas del 30 de junio de 2015 en el Km. 75 de la Autopista de Cuota Peñon - Texcoco en el Centro Mexicano de Capacitación en Agua y Saneamiento y se dio por concluida a las 12:00 horas del mismo día sin que existiera observación alguna por parte de los asistentes."},
                            {"name":"Fecha","text":"06/30/2015"},
                            {"name":"Estatus","text":"Concluido"},
                            {"name":"Documentos soporte", "text":"Acta de visita al sitio de realización de los trabajos publicada en CompraNet el 1 de julio de 2015"}
                        ]
                    },
                    {
                        "name": "Modificaciones",
                        "text":"No hubo modificaciones"
                    }
                ]
            });

            break;
        case 'award':
            res.json( {
                "name": "Adjudicación",
                "text":"",
                "children": [
                    {"name": "ID licitación","text":"838749"},
                    {"name": "ID adjudicación","text":"LO-009KDH999-N50-2015"},
                    {"name": "Título","text":"Acta de emisión de fallo"},
                    {"name": "Descripción","text":"Con fundamento en lo dispuesto en el artículo 39, fracción III de la Ley de Obras Públicas y Servicios Relacionados con las Mismas, se adjudica el contrato al consorcio integrado por las empresas Calzada Construcciones, S. A. de C. V. y Construcciones y Dragados del Sureste, S. A. de C. V., por un importe de $192,522,597.09 (ciento noventa y dos millones quinientos veinticinco mil quinientos noventa y siete Pesos 09/100 M.N.), monto sin considerar el IVA, por resultar ser la propuesta que al ser evaluada técnica y ecómicamente, obtuvo el puntaje más alto acorde al mecanismo de evalación previsto en la convocatoria"},
                    {"name": "Estatus","text":"Adjudicado"},
                    {"name": "Fecha","text":"09/28/2015"},
                    {"name": "Valor","text":"192522597.09"},
                    {"name": "Inconformidades recibidas","text":"0"},
                    {
                        "name": "Proveedores",
                        "text":"",
                        "children": [
                            {"name": "ID adjudicación","text":"LO-009KDH999-N50-2015"},
                            {"name": "ID proveedor","text":"1. Calzada Construcciones, S. A. de C. V.: CCO980814BU4    2. Construcciones y Dragados del Sureste, S. A. de C. V.: CDS970212MV3"},
                            {"name": "Nombre","text":"1. Calzada Construcciones, S. A. de C. V.    2. Construcciones y Dragados del Sureste, S. A. de C. V."},
                            {"name": "Dirección","text":"",
                                "children":[
                                    {"name":"Calle","text":"Lope de Vega 117, piso 6"},
                                    {"name":"Colonia","text":"Polanco"},
                                    {"name":"Municipio","text":"Miguel Hidalgo"},
                                    {"name":"Entidad","text":"Ciudad de México"},
                                    {"name":"País","text":"México"},
                                    {"name":"Código postal","text":"11560"},
                                ]},
                            {"name": "Contacto","text":"No aplica"}
                        ]
                    },
                    {
                        "name": "Documentos",
                        "text":"",
                        "children": [
                            {"name": "ID adjudicación","text":"LO-009KDH999-N50-2015"},
                            {"name": "Reportes de evaluación","text":"Acta de Emisión de Fallo"},
                            {"name": "Propuesta ganadora","text":"Propuesta técnica y económica del Consorcio integrado por las empresas Calzada Construcciones, S. A. de C. V. y Construcciones y Dragados del Sureste, S. A. de C. V."},
                            {"name": "Inconformidades","text":"No se presentaron inconformidades sobre el procedimiento de contratación"}
                        ]
                    },
                    {"name":"Item","text":"",
                        "children":[
                            {"name":"ID adjudicación","text":"LO-009KDH999-N50-2015"},
                            {"name":"ID item","text":"62501001"},
                            {"name":"Descripción","text":"Construcción aeropista"},
                            {"name":"Clasificación","text":"Obra pública"},
                            {"name":"Unidad item","text":"Obra"}
                        ]
                    },
                    {
                        "name": "Modificaciones",
                        "text":"No hubo modificaciones"
                    }
                ]
            });
            break;
        case 'contract':
            res.json({
                "name": "Contratación",
                "text":"",
                "children": [
                    {"name": "ID adjudicación","text":"LO-009KDH999-N50-2015"},
                    {"name": "ID contrato","text":"LPN-OP-DCAGI-SC-076/15"},
                    {"name": "Título","text":"Para los trabajos relativos a la construcción del drenaje pluvial temporal"},
                    {"name": "Descripción","text":"Construcción de tres drenes principales, tres canales existentes (parcialmente), tres plantas de bombeo, dos lagunas de regulación, veintidós alcantarilla y dos salidas al Dren General del Valle, al poniente del predio. Rehabilitación de caminos de acceso y puentes alcantarilla para permitir el paso de vehículos de una margen del dren a la margen opuesta."},
                    {"name": "Estatus","text":"Activo"},
                    {"name": "Periodo","text":"","children":[
                        {"name":"Inicio","text":"10/09/2015"},
                        {"name":"Fin","text":"03/07/2016"}
                    ]},
                    {"name": "Valor","text":"192525597.09"},
                    {"name": "Fecha de firma","text":"10/09/2015"},
                    {
                        "name": "Item",
                        "text":"",
                        "children": [
                            {"name":"ID contrato","text":"LPN-OP-DCAGI-SC-076/15"},
                            {"name":"ID item","text":"62501001"},
                            {"name":"Descripción","text":"Construcción aeropista"},
                            {"name":"Clasificación","text":"Obra pública"},
                            {"name":"Unidad item","text":"Obra"}
                        ]
                    },
                    {
                        "name": "Documentos",
                        "text":"",
                        "children": [
                            {"name": "Contrato firmado","text":"Contrato plurianual de obra pública a precios unitarios y tiempo determinado número LPN-OP-DCAGI-SC-076/15"},
                            {"name": "Cláusulas","text":'Cláusula Décimo Quinta del Contrato.- Entrega, Verificación y Finiquito de "La Obra"'},
                            {"name": "Cronograma del contrato","text":"Anexo 17 del contrato: Programa de ejecución de los trabajos"},
                            {"name": "Anexos del contrato","text":'Anexo 1: Suficiencia presupuestaria   Anexo 2: Escrituras públicas de Calzada Construcciones, S.A. de C.V.   Anexo 3: Poder del representante legal de Calzada Construcciones, S.A. de C.V.   Anexo 4: Cédula de Registro Federal de Contribuyentes de Calzada Construcciones, S.A. de C.V.   Anexo 5: Declaración de Calzada Construcciones, S.A. de C.V. de no encontrarse en los supuestos de los artículos 51 y 78 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas   Anexo 6: Opinión del cumplimiento de obligaciones fiscales de Calzada Construcciones, S.A. de C.V.   Anexo 7: Escrituras públicas de Construcciones y Dragados del Sureste, S.A. de C.V.   Anexo 8: Poder del representante legal de Construcciones y Dragados del Sureste, S.A. de C.V.   Anexo 9: Cédula del registro federal de contribuyentes de Construcciones y Dragados del Sureste, S.A. de C.V.   Anexo 10: Declaración de Construcciones y Dragados del Sureste, S.A. de C.V. de no encontrarse en los supuestos de los artículos 51 y 78 de la Ley de Obras Públicas y Servicios Relacionados con las Mismas   Anexo 11: Opinión del cumplimiento de obligaciones fiscales de Construcciones y Dragados del Sureste, S.A. de C.V.   Anexo 12: Convenio de Participación COnjunta entre Calzada Construcciones, S.A. de C.V. y Construcciones Dragados del Sureste, S.A. de C.V.   Anexo 13: Manifestación de no encontrarse en la estratificación de Micro, Pequeña o Mediana Empresa   Anexo 14: Opinión de cumplimiento de obligaciones fiscales en materia de seguridad social de las contratistas   Anexo 15: Propuesta conjunta de Calzada Construcciones, S.A. de C.V. y Construcciones y Dragados del Sureste, S.A. de C.V.   Anexo 16: Términos de Referencia   Anexo 17: Programa de Ejecución de los Trabajos   Anexo 18: Catálogo de Conceptos   Anexo 19: Programa de Pagos   Anexo 20: Datos bancarios de los contratistas   Anexo 21: Programa de amortización del anticipo'},
                            {"name": "Subcontratos","text":"GACM no ha sido notificado sobre ninguna subcontratación"},
                            {"name": "Garantías","text":"","children":[
                                {"name":"Garantías anticipo","text":"Fianza número 0031500012922 emitida el 2015-10-09 por Mapfre Fianzas, S.A. de C.V."},
                                {"name":"Garantías cumplimiento","text":"Fianza números 0031500013560 emitida el 2015-10-09 por Mapfre Fianzas, S.A. de C.V."}
                            ]}
                        ]
                    },
                    {
                        "name": "Modificaciones",
                        "text":"No se ha celebrado ningún convenio modificatorio."
                    }
                ]
            });
            break;
        case 'implementation':

            edca_db.tx(function (t) {

            }).then(function(data){

            }).catch(function (error) {
                console.log(error);
            });

            res.json({
                "name": "Implementación",
                "text":"",
                "children": [
                    {
                        "name": "Transacción",
                        "text":"",
                        "children": [
                            {"name": "ID adjudicación","text":"LO-009KDH999-N50-2015"},
                            {"name": "ID contrato","text":"LPN-OP-DCAGI-SC-076/15"},
                            {"name": "ID transacción","text":"1219377"},
                            {"name": "Fuente","text":"Fideicomiso para el desarrollo del Nuevo Aeropuerto Internacional de la Ciudad de México"},
                            {"name": "Fecha","text":"11/27/2015"},
                            {"name": "Monto","text":"15,786,533.19"},
                            {"name": "Emisor","text":"Nacional Financiera, Sociedad Nacional de Crédito, Institución de Banca de Desarrollo, como fiduciaria del Fideicomiso para el desarrollo del NAICM"},
                            {"name": "Receptor","text":"Consorcio integrado por las empresas Calzada Construcciones, S. A. de C. V. y Construcciones y Dragados del Sureste, S. A. de C. V."}
                        ]
                    },
                    {
                        "name": "Documentos",
                        "text":"",
                        "children": [
                            {"name": "Avance físico","text":"18.34%"},
                            {"name": "Avance financiero","text":"10%"},
                            {"name": "Certificado de terminación","text":"El contrato continúa en ejecución"},
                            {"name": "Auditoría final","text":"No aplica"}
                        ]
                    },
                    {
                        "name": "Hitos",
                        "text":"No se han recibido estimaciones por parte del contratista."
                    }

                ]
            });
            break;
        case 'all':
            res.json({});
            break;
        default:
            res.json({'error': req.params.stage +' No es una etapa de un proceso de contratación'});
            break;
    }
});

/*
// dashboard contract list by page
 router.get('/contratos/:page',function (req, res) {
 res.render('dashboard',{ title: 'Estandar de Datos de Contrataciones Abiertas', contracts : contracts });
 });
 */


/*
var contracts = [
    {
        number : '1',
        id: 'LO-009KDH999-N5-2014',
        id_naicm: 'LPN-O-DCAGI-SC-014/14',
        type: 'Licitación pública',
        year: '2015',
        months: '',
        date_signed: new Date(),
        product : 'Servicio de extracción de ademes y restitución de terreno.',
        amount: 39724276.56,
        currency: 'MXN',
        download_url : '',
        url :'/contrataciones-abiertas/contrato/1'
    },
    {
        number : '2',
        id: 'SO-009KDH999-N24-2015',
        id_naicm: 'AD-SRO-DCAGI-SC-005/15',
        type: 'Adjudicación directa',
        year: '2015',
        months: '',
        date_signed: new Date(),
        product : 'Plan acciones de monitoreo y conservación de aves para el NAICM.',
        amount: 521999.84,
        currency: 'MXN',
        download_url : '',
        url : '/contrataciones-abiertas/contrato/2'
    },
    {
        number : '3',
        id: 'SO-009KDH999-N23-2015',
        id_naicm: 'AD-SRO-DCAGI-SC-009/15',
        type: 'Adjudicación directa',
        year: '2015',
        months: '',
        date_signed: new Date(),
        product : 'Elaboración del programa de monitoreo de ruido perimetral para las etapas de preparación del sitio, construcción, y, operación y mantenimiento del NAICM.',
        amount: 638000.00,
        currency: 'MXN',
        download_url : '',
        url : '/contrataciones-abiertas/contrato/3'
    },
    {
        number : '4',
        id: 'SO-009KDH999-N26-2015',
        id_naicm: 'AD-SRO-DCAGI-SC-013/15',
        type: 'Adjudicación directa',
        year: '2015',
        months: '',
        date_signed: new Date(),
        product : 'Plan de monitoreo, registro y verificación de emisión de gases de efecto invernadero para el NAICM.',
        amount: 539400.00,
        currency: 'MXN',
        download_url : 'Adjudicación directa',
        url : '/contrataciones-abiertas/contrato/4'
    },
    {
        number : '5',
        id: 'IO-009KDH999-N11-2015',
        id_naicm: 'ITP-OP-DCAGI-SC-014/15',
        type: 'Invitación a tres',
        year: '2015',
        months: '',
        date_signed: new Date(),
        product : 'Construcción de caminos de acceso a zona del edificio terminal de la primera etapa, necesarios para la caracterización geotécnica inical.',
        amount: 9429941.46,
        currency: 'MXN',
        download_url : '',
        url : '/contrataciones-abiertas/contrato/5'
    },
    {
        number : '6',
        id: 'IO-009KDH999-N10-2015',
        id_naicm: 'ITP-SRO-DCAGI-SC-016/15',
        type: 'Invitación a tres',
        year: '2015',
        months: '',
        date_signed: new Date(),
        product : 'Servicios de supervisión para la obra: extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Ciudad de México.',
        amount: 2501985.67,
        currency: 'MXN',
        download_url : '',
        url : '/contrataciones-abiertas/contrato/6'
    },
    {
        number : '7',
        id: 'LO-099KDH999-N20-2015',
        id_naicm: 'LPN-O-DCAGI-SC-024/15',
        type: 'Licitación pública',
        year: '2015',
        months: '',
        date_signed: new Date(),
        product : 'Construcción de caminos de accesos y plataformas para exploración geotécnica para la pista No 2 del Nuevo Aeropuerto Internacional de la Ciudad de México.',
        amount: 5844840.96,
        currency: 'MXN',
        download_url : '',
        url : '/contrataciones-abiertas/contrato/7'
    },
    {
        number : '8',
        id: 'LO-099KDH999-T15-2015',
        id_naicm: 'LPI-SRO-DCAGI-SC-030/15',
        type: 'Licitación pública',
        year: '2015',
        months: '',
        date_signed: new Date(),
        product : 'Estudio de las caracteristicas técnicas de infraestructura y diseño esquematico de la terminal de carga del Nuevo Aeropuerto Internacional de la Ciudad de México.',
        amount: 13514000.00,
        currency: 'MXN',
        download_url : '',
        url : '/contrataciones-abiertas/contrato/8'
    },
    {
        number : '9',
        id: 'LO-009KDH999-N46-2015',
        id_naicm: 'LPN-SRO-DCAGI-SC-041/15',
        type: 'Licitación pública',
        year: '2015',
        months: '',
        date_signed: new Date(),
        product : 'Plan de monitoreo y conservación de aves del proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México.',
        amount: 16684244.272,
        currency: 'MXN',
        download_url : '',
        url : '/contrataciones-abiertas/contrato/9'
    },
    {
        number : '10',
        id: 'LO-009KDH999-N42-2015',
        id_naicm: 'LPN-SRO-DCAGI-SC-042/15',
        type: 'Licitación pública',
        year: '2015',
        date_signed: new Date(),
        product : 'Implementación del programa de rescate de flora y fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México.',
        amount: 13832891.6792,
        currency: 'MXN',
        download_url : '',
        url : '/contrataciones-abiertas/contrato/10'
    },
    {
        number : '11',
        id: 'LO-009KDH999-N45-2015',
        id_naicm: 'LPN-SRO-DCAGI-SC-043/15',
        type: 'Licitación pública',
        year: '2015',
        date_signed: new Date(),
        product : 'Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México.',
        amount: 21963669.4016,
        currency: 'MXN',
        download_url : '',
        url : '/contrataciones-abiertas/contrato/11'
    },
    {
        number : '12',
        id: 'IO-009KDH999-N41-2015',
        id_naicm: 'ITP-SRO-DCAGI-SC-048/15',
        type: 'Invitación a tres',
        year: '2015',
        date_signed: new Date(),
        product : 'La elaboración del estudio de las características topográficas del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).',
        amount: 38949488.17,
        currency: 'MXN',
        download_url : '',
        url : '/contrataciones-abiertas/contrato/12'
    },
    {
        number : '13',
        id: 'IO-009KDH999-N54-2015',
        id_naicm: 'ITP-SRO-DCAGI-SC-063/15',
        type: 'Invitación a tres',
        year: '2015',
        date_signed: new Date(),
        product : 'Supervisión para: construcción del proyecto integral consistente en barda y camino perimetral, alumbrado, servicios inducidos y casetas de acceso para el Nuevo Aeropuerto Internacional de la Ciudad de México (primera etapa).',
        amount: 3812525.54,
        currency: 'MXN',
        download_url : '',
        url : '/contrataciones-abiertas/contrato/13'
    },
    {
        number : '14',
        id: 'LO-009KDH999-N47-2015',
        id_naicm: 'LPN-OP-DCAGI-SC-066/15',
        type: 'Licitación pública',
        year: '2015',
        date_signed: new Date(),
        product : 'Desarrollo del proyecto ejecutivo, construcción, equipamiento de mobiliario e instalaciones complementarias para el campamento del Grupo Aeroportuario de la Ciudad de México en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México.',
        amount: 129973731.20,
        currency: 'MXN',
        download_url : '',
        url : '/contrataciones-abiertas/contrato/14'
    },
    {
        number : '15',
        id: 'LO-009KDH999-N50-2015',
        id_naicm: 'LPN-OP-DCAGI-SC-076/15',
        type: 'Licitación pública',
        year: '2015',
        date_signed: new Date(),
        product : 'Trabajos relativos a la construcción del drenaje pluvial temporal del Nuevo Aeropuerto de la Ciudad de México.',
        amount: 223329692.62,
        currency: 'MXN',
        download_url : '',
        url : '/contrataciones-abiertas/contrato/15'
    },
    {
        number : '16',
        id: 'LO-009KDH999-T52-2015',
        id_naicm: 'LPI-SRO-DCAGI-SC-079/15',
        type: 'Licitación pública',
        year: '2015',
        date_signed: new Date(),
        product : 'Diseñar e instrumentar el modelo virtual de información para la construcción del BIM del NAICM.',
        amount: 158629469.03,
        currency: 'MXN',
        download_url : '',
        url : '/contrataciones-abiertas/contrato/16'
    },
    {
        number : '17',
        id: 'LO-009KDH999-N79-2015',
        id_naicm: 'LPN-OP-DCAGI-SC-112/15',
        type: 'Licitación pública',
        year: '2015',
        date_signed: new Date(),
        product : 'Convocatoria de nivelación y limpieza del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México.',
        amount: 2044851759.9544,
        currency: 'MXN',
        download_url : '',
        url : '/contrataciones-abiertas/contrato/17'
    },
    {
        number : '18',
        id: 'LO-009KDH999-N80-2015',
        id_naicm: 'LPN-OP-DCAGI-SC-114/15',
        type: 'Licitación pública',
        year: '2015',
        date_signed: new Date(),
        product : 'Convocatoria de construcción de los caminos provisionales de acceso al Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) ejecutando trabajos de terraceria, estructuras y obras de drenaje, pavimentación y señalamiento.',
        amount: 705599669.90,
        currency: 'MXN',
        download_url : '',
        url : '/contrataciones-abiertas/contrato/18'
    },
    {
        number : '19',
        id: 'LO-009KDH999-N78-2015',
        id_naicm: 'LPN-OP-DCAGI-SC-115/15',
        type: 'Licitación pública',
        year: '2015',
        date_signed: new Date(),
        product : 'Convocatoria de carga, acarreo y descarga fuera del poligono del material existente producto de depositos de demoliciones, desperdicios y desazolve.',
        amount: 572943111.00,
        currency: 'MXN',
        download_url : '',
        url : '/contrataciones-abiertas/contrato/19'
    },
    {
        number : '20',
        id: 'LO-009KDH999-N86-2015',
        id_naicm: 'LPN-SRO-DCAGI-SC-117/15',
        type: 'Licitación pública',
        year: '2015',
        date_signed: new Date(),
        product : 'Supervisión técnica, administrativa y de control de calidad para los trabajos de nivelación y limpieza del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México.',
        amount: 11276263.6272,
        currency: 'MXN',
        download_url : '',
        url : '/contrataciones-abiertas/contrato/20'
    },
    {
        number : '21',
        id: 'LO-009KDH999-N87-2015',
        id_naicm: 'LPN-SRO-DCAGI-SC-118/15',
        type: 'Licitación pública',
        year: '2015',
        date_signed: new Date(),
        product : 'Supervisión técnica, administrativa y de control de calidad para los trabajos de construcción de los caminos provisionales de acceso al Nuevo Aeropuerto Intenacional de la Ciudad de México (NAICM) ejecutanto trabajos de terraceria, estructuras y obras de drenaje, pavimentación y señalamiento.',
        amount: 13970275.444,
        currency: 'MXN',
        download_url : '',
        url : '/contrataciones-abiertas/contrato/21'
    },
    {
        number : '22',
        id: 'AO-009KDH999-E26-2016',
        id_naicm: 'AD-SRO-DCAGI-SC-002/16',
        type: 'Adjudicación directa',
        year: '2016',
        date_signed: new Date(),
        product : 'Supervisión del proyecto ejecutivo, construcción, equipamiento, mobiliario e instalaciones complementarias para el campamento del Grupo Aeroportuario de la Ciudad de México en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México.',
        amount: 4286458.44,
        currency: 'MXN',
        download_url : '',
        url : '/contrataciones-abiertas/contrato/22'
    },
    {
        number : '23',
        id: 'AO-009KDH999-E20-2016',
        id_naicm: 'AD-SRO-DCAGI-SC-003/16',
        type: 'Adjudicación directa',
        year: '2016',
        date_signed: new Date(),
        product : 'Supervisión de la construcción del drenaje pluvial temporal del Nuevo Aeropuerto Intenacional de la Ciudad de México.',
        amount: 8909803.13,
        currency: 'MXN',
        download_url : '',
        url : '/contrataciones-abiertas/contrato/23'
    },
    {
        number : '24',
        id: 'IO-009KDH999-E15-2016',
        id_naicm: 'ITP-OP-DCAGI-SC-012/16',
        type: 'Invitación a tres',
        year: '2016',
        date_signed: new Date(),
        product : 'Construcción de accesos y plataformas para exploración geotécnica, rehabilitación de tramos de prueba y bacheo somero de caminos existentes dentro del terreno para el Nuevo Aeropuerto Internacional de la Ciudad de México.',
        amount: 12715541.31,
        currency: 'MXN',
        download_url : '',
        url : '/contrataciones-abiertas/contrato/24'
    },
    {
        number : '25',
        id: 'IO-009KDH999-E96-2015',
        id_naicm: 'ITP-SRO-DCAGI-SC-018/16',
        type: 'Invitación a tres',
        year: '2016',
        date_signed: new Date(),
        product : 'Integración de la estratégia global y modelo de negocios para el Nuevo Aeropuerto Internacional de la Ciudad de México.',
        amount: 91640000.00,
        currency: 'MXN',
        download_url : '',
        url : '/contrataciones-abiertas/contrato/25'
    }
];*/

module.exports = router;
