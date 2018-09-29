function _insert(client,insertSQLString,value)
{
    console.log("insert beginning");
    client.query(insertSQLString, value,  function(error, results)
    {
        if(error)
        {
            console.log("ClientReady Error: " + error.message);
                client.end();
            return;
        }
        console.log('Inserted: ' + results.affectedRows + ' row.');
            console.log('insert success...\n');
    });
    console.log("insert end\n");
}

function _select(client,selectSQLString)
{
    console.log("select beginning");
    client.query(selectSQLString,  function selectCb(error, results, fields)
    {
        console.log("in select callback function");
        if (error)
        {
            console.log('GetData Error: ' + error.message);
                client.end();
            return;
        }


        console.log('results.rowCount: ' + results.rowCount);
        if(results.rowCount > 0)
        {
            var firstResult, resultSet = '';
            for(var i = 0, len = results.rowCount; i < len; i++)
            {
                firstResult = results.rows[i];
                resultSet += 'name:' + firstResult['name'] + ' ' + 'time:' + firstResult['time'] + ' ' +
                    'month:' + firstResult['month'] + '\n';
            }
        }
        console.log(resultSet);
        /* 添加功能：使查询结果集返回到客户端并保证此函数的通用性. */
    });
    console.log("select end\n");
}

function _update(client,updateSQLString)
{
    console.log("update beginning");
    client.query(updateSQLString,function(error, results)
    {
        if(error)
        {
            console.log("ClientReady Error: " + error.message);
                client.end();
            return;
        }
        console.log('update success...\n');
    });
    console.log("update end\n");
}

function _delete(client,deleteSQLString)
{
    console.log("delete beginning");
    client.query(deleteSQLString,  function(error, results)
    {
        if(error)
        {
            console.log("ClientReady Error: " + error.message);
                client.end();
            return;
        }
        console.log('delete success...\n');
    });
    console.log("delete end\n");
}


exports._insert = _insert;
exports._select = _select;
exports._update = _update;
exports._delete = _delete;