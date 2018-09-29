var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {

  console.log(req.url);


  res.render('index', { title: 'Express' });
});



router.get('/about', function(req, res, next) {
  res.sendfile('./views/about.html');
});

module.exports = router;
