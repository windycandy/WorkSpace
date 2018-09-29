var express = require('express');
var router = express.Router();

router.get('/getlocation', function(req, res, next) {
    res.send('respond with a getlocation');
});

module.exports = router;