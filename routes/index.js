var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('index', { title: 'Estandar de Datos de Contrataciones Abiertas' });
});


router.get('/tree',function (req, res) {
    res.render('tree');
});


router.get('/dashboard',function (req, res) {
    res.render('dashboard',{ title: 'Estandar de Datos de Contrataciones Abiertas' });
});

module.exports = router;
