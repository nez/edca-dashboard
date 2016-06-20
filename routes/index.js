var express = require('express');
var router = express.Router();

var contracts = [
    {
        number : '1',
        id: 'LO-009KDH999-N5-2014',
        id_naicm: 'LPN-O-DCAGI-SC-014/14',
        year: '2015',
        product : 'Servicio de extracción de ademes y restitución de terreno.',
        amount: '$39724276.56',
        download_url : '',
        url :'/contrataciones-abiertas/tree/1'
    },
    {
        number : '2',
        id: 'SO-009KDH999-N24-2015',
        id_naicm: 'AD-SRO-DCAGI-SC-005/15',
        year: '2015',
        product : 'Plan acciones de monitoreo y conservación de aves para el NAICM.',
        amount: '$521999.84',
        download_url : '',
        url : '/contrataciones-abiertas/tree/2'
    },
    {
        number : '3',
        id: 'SO-009KDH999-N23-2015',
        id_naicm: 'AD-SRO-DCAGI-SC-009/15',
        year: '2015',
        product : 'Elaboración del programa de monitoreo de ruido perimetral para las etapas de preparación del sitio, construcción, y, operación y mantenimiento del NAICM.',
        amount: '$638000.00',
        download_url : '',
        url : '/contrataciones-abiertas/tree/3'
    },
    {
        number : '4',
        id: 'SO-009KDH999-N26-2015',
        id_naicm: 'AD-SRO-DCAGI-SC-002/16',
        year: '2015',
        product : 'Plan de monitoreo, registro y verificación de emisión de gases de efecto invernadero para el NAICM.',
        amount: '$539400.00',
        download_url : '',
        url : '/contrataciones-abiertas/tree/4'
    },
    {
        number : '5',
        id: 'IO-009KDH999-N11-2015',
        id_naicm: 'ITP-OP-DCAGI-SC-014/15',
        year: '2015',
        product : 'Construcción de caminos de acceso a zona del edificio terminal de la primera etapa, necesarios para la caracterización geotécnica inical.',
        amount: '$9429941.46',
        download_url : '',
        url : '/contrataciones-abiertas/tree/5'
    },
    {
        number : '6',
        id: 'IO-009KDH999-N10-2015',
        id_naicm: 'ITP-SRO-DCAGI-SC-016/15',
        year: '2015',
        product : 'Servicios de supervisión para la obra: extracción de ademes y restitución del terreno que ocupan dichos elementos ubicados en la poligonal para el Nuevo Aeropuerto Internacional de la Ciudad de México.',
        amount: '$2501985.67',
        download_url : '',
        url : '/contrataciones-abiertas/tree/6'
    },
    {
        number : '7',
        id: 'LO-099KDH999-N20-2015',
        id_naicm: 'LPN-O-DCAGI-SC-024/15',
        year: '2015',
        product : 'Construcción de caminos de accesos y plataformas para exploración geotécnica para la pista No 2 del Nuevo Aeropuerto Internacional de la Ciudad de México.',
        amount: '$5844840.96',
        download_url : '',
        url : '/contrataciones-abiertas/tree/7'
    },
    {
        number : '8',
        id: 'LO-099KDH999-T15-2015',
        id_naicm: 'ITP-OP-DCAGI-SC-012/16',
        year: '2015',
        product : 'Estudio de las caracteristicas técnicas de infraestructura y diseño esquematico de la terminal de carga del Nuevo Aeropuerto Internacional de la Ciudad de México.',
        amount: '$13514000.00',
        download_url : '',
        url : '/contrataciones-abiertas/tree/8'
    },
    {
        number : '9',
        id: 'LO-009KDH999-N46-2015',
        id_naicm: 'LPN-SRO-DCAGI-SC-041/15',
        year: '2015',
        product : 'Plan de monitoreo y conservación de aves del proyecto del Nuevo Aeropuerto Internacional de la Ciudad de México.',
        amount: '$16684244.272',
        download_url : '',
        url : '/contrataciones-abiertas/tree/9'
    },
    {
        number : '10',
        id: 'LO-009KDH999-N42-2015',
        id_naicm: 'LPN-SRO-DCAGI-SC-042/15',
        year: '2015',
        product : 'Implementación del programa de rescate de flora y fauna para el Nuevo Aeropuerto Internacional de la Ciudad de México.',
        amount: '$13832891.6792',
        download_url : '',
        url : '/contrataciones-abiertas/tree/10'
    },
    {
        number : '11',
        id: 'LO-009KDH999-N45-2015',
        id_naicm: 'LPN-SRO-DCAGI-SC-043/15',
        year: '2015',
        product : 'Implementación del plan de restauración ecológica para el Nuevo Aeropuerto Internacional de la Ciudad de México.',
        amount: '$21963669.4016',
        download_url : '',
        url : '/contrataciones-abiertas/tree/11'
    },
    {
        number : '12',
        id: 'IO-009KDH999-N41-2015',
        id_naicm: 'ITP-SRO-DCAGI-SC-048/15',
        year: '2015',
        product : 'La elaboración del estudio de las características topográficas del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM).',
        amount: '$38949488.17',
        download_url : '',
        url : '/contrataciones-abiertas/tree/12'
    },
    {
        number : '13',
        id: 'IO-009KDH999-N54-2015',
        id_naicm: 'LPN-SRO-DCAGI-SC-042/15',
        year: '2015',
        product : 'Supervisión para: construcción del proyecto integral consistente en barda y camino perimetral, alumbrado, servicios inducidos y casetas de acceso para el Nuevo Aeropuerto Internacional de la Ciudad de México (primera etapa).',
        amount: '$3812525.54',
        download_url : '',
        url : '/contrataciones-abiertas/tree/13'
    },
    {
        number : '14',
        id: 'LO-009KDH999-N47-2015',
        id_naicm: 'LPN-OP-DCAGI-SC-066/15',
        year: '2015',
        product : 'Desarrollo del proyecto ejecutivo, construcción, equipamiento de mobiliario e instalaciones complementarias para el campamento del Grupo Aeroportuario de la Ciudad de México en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México.',
        amount: '$129973731.20',
        download_url : '',
        url : '/contrataciones-abiertas/tree/14'
    },
    {
        number : '15',
        id: 'LO-009KDH999-N50-2015',
        id_naicm: 'LPN-OP-DCAGI-SC-076/15',
        year: '2015',
        product : 'Trabajos relativos a la construcción del drenaje pluvial temporal del Nuevo Aeropuerto de la Ciudad de México.',
        amount: '$223329692.62',
        download_url : '',
        url : '/contrataciones-abiertas/tree/15'
    },
    {
        number : '16',
        id: 'LO-009KDH999-T52-2015',
        id_naicm: 'LPI-SRO-DCAGI-SC-079/15',
        year: '2015',
        product : 'Diseñar e instrumentar el modelo virtual de información para la construcción del BIM del NAICM.',
        amount: '$158629469.03',
        download_url : '',
        url : '/contrataciones-abiertas/tree/16'
    },
    {
        number : '17',
        id: 'LO-009KDH999-N79-2015',
        id_naicm: 'LPN-OP-DCAGI-SC-112/15',
        year: '2015',
        product : 'Convocatoria de nivelación y limpieza del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México.',
        amount: '$2044851759.9544',
        download_url : '',
        url : '/contrataciones-abiertas/tree/17'
    },
    {
        number : '18',
        id: 'LO-009KDH999-N80-2015',
        id_naicm: 'LPN-OP-DCAGI-SC-114/15',
        year: '2015',
        product : 'Convocatoria de construcción de los caminos provisionales de acceso al Nuevo Aeropuerto Internacional de la Ciudad de México (NAICM) ejecutando trabajos de terraceria, estructuras y obras de drenaje, pavimentación y señalamiento.',
        amount: '$705599669.90',
        download_url : '',
        url : '/contrataciones-abiertas/tree/18'
    },
    {
        number : '19',
        id: 'LO-009KDH999-N78-2015',
        id_naicm: 'LPN-OP-DCAGI-SC-115/15',
        year: '2015',
        product : 'Convocatoria de carga, acarreo y descarga fuera del poligono del material existente producto de depositos de demoliciones, desperdicios y desazolve.',
        amount: '$572943111.00',
        download_url : '',
        url : '/contrataciones-abiertas/tree/19'
    },
    {
        number : '20',
        id: 'LO-009KDH999-N86-2015',
        id_naicm: 'LPN-SRO-DCAGI-SC-117/15',
        year: '2015',
        product : 'Supervisión técnica, administrativa y de control de calidad para los trabajos de nivelación y limpieza del terreno del Nuevo Aeropuerto Internacional de la Ciudad de México.',
        amount: '$11276263.6272',
        download_url : '',
        url : '/contrataciones-abiertas/tree/20'
    },
    {
        number : '21',
        id: 'LO-009KDH999-N87-2015',
        id_naicm: 'LPN-SRO-DCAGI-SC-118/15',
        year: '2015',
        product : 'Supervisión técnica, administrativa y de control de calidad para los trabajos de construcción de los caminos provisionales de acceso al Nuevo Aeropuerto Intenacional de la Ciudad de México (NAICM) ejecutanto trabajos de terraceria, estructuras y obras de drenaje, pavimentación y señalamiento.',
        amount: '$13970275.444',
        download_url : '',
        url : '/contrataciones-abiertas/tree/21'
    },
    {
        number : '22',
        id: 'AO-009KDH999-E26-2016',
        id_naicm: 'AD-SRO-DCAGI-SC-002/16',
        year: '2016',
        product : 'Supervisión del proyecto ejecutivo, construcción, equipamiento, mobiliario e instalaciones complementarias para el campamento del Grupo Aeroportuario de la Ciudad de México en el sitio del Nuevo Aeropuerto Internacional de la Ciudad de México.',
        amount: '$4286458.44',
        download_url : '',
        url : '/contrataciones-abiertas/tree/22'
    },
    {
        number : '23',
        id: 'AO-009KDH999-E20-2016',
        id_naicm: 'AD-SRO-DCAGI-SC-003/16',
        year: '2016',
        product : 'Supervisión de la construcción del drenaje pluvial temporal del Nuevo Aeropuerto Intenacional de la Ciudad de México.',
        amount: '$8909803.13',
        download_url : '',
        url : '/contrataciones-abiertas/tree/23'
    },
    {
        number : '24',
        id: 'IO-009KDH999-E15-2016',
        id_naicm: 'ITP-OP-DCAGI-SC-012/16',
        year: '2016',
        product : 'Construcción de accesos y plataformas para exploración geotécnica, rehabilitación de tramos de prueba y bacheo somero de caminos existentes dentro del terreno para el Nuevo Aeropuerto Internacional de la Ciudad de México.',
        amount: '$12715541.31',
        download_url : '',
        url : '/contrataciones-abiertas/tree/24'
    },
    {
        number : '25',
        id: 'IO-009KDH999-E96-2015',
        id_naicm: 'ITP-SRO-DCAGI-SC-018/16',
        year: '2016',
        product : 'Integración de la estratégia global y modelo de negocios para el Nuevo Aeropuerto Internacional de la Ciudad de México.',
        amount: '$91640000.00',
        download_url : '',
        url : '/contrataciones-abiertas/tree/25'
    }
];

/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('index', { title: 'Estandar de Datos de Contrataciones Abiertas' });
});
/* GET home page. */
router.get('/luis', function(req, res, next) {
    res.render('index1', { title: 'Estandar de Datos de Contrataciones Abiertas' });
});

router.get('/tree/:n',function (req, res) {
    res.render('tree',{  contract : contracts[ req.params.n -1 ] });
});

router.post('/contracts', function (req, res) {
    res.send(contracts);
});

router.get('/contratos/',function (req, res) {
    res.render('dashboard',{ title: 'Estandar de Datos de Contrataciones Abiertas', contracts : contracts });
});

router.get('/contratos/:page',function (req, res) {
    res.render('dashboard',{ title: 'Estandar de Datos de Contrataciones Abiertas', contracts : contracts });
});

module.exports = router;
