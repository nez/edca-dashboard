var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Estandar de Datos de Contrataciones Abiertas' });
});

module.exports = router;
