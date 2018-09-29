var express = require('express');
var f = require('./pgfunction');
var pg = require('pg');
var router = express.Router();


var conString = "postgres://postgres:123123@localhost/test";
var client = new pg.Client(conString);




router.get('/', function(req, res, next) {
    console.log("pg study");
});

var selectSQLString = 'select * from app_list';
var insertSQLString = 'insert into app_list values($1,$2,$3)';
var updateSQLString = "update app_list set NAME='ipone' where ID='4'";
var deleteSQLString = "delete from app_list where ID='10'";

router.get('/test', function(req, res, next) {

    client.connect(function(error, results) {
        if(error){
            console.log('ClientConnectionReady Error: ' + error.message);
            client.end();
            return;
        }
        console.log('Connecting to postgres...');
        console.log('Connected to postgres automatically.');
        console.log('connection success...\n');
        var value = ['dongyin', 22  ,'2016-11-22'];
        f._select(client,selectSQLString);
        console.log('.......................');
        //f._insert(client,insertSQLString,value);
        console.log('.......................');
        f._select(client,selectSQLString);
        //f._delete(client,deleteSQLString);
    });
});




module.exports = router;
