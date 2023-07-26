const http = require('http');
const managedb = require('./managedb');
const { abort } = require('process');

http.createServer( async function (request, response) {
    response.writeHead(200, {'Content-Type': 'text/html'});
    const pathname = request.url;
    if(pathname==='/') //server and tests
    {
        response.end("server ready");
    }
    else    //methods with connection to db
    {
        if(await managedb.connect()===1){await managedb.close();response.writeHead(501, {'Content-Type': 'text/html'});response.end("database connection failed");}
        if(pathname.startsWith('/accounts')) 
        {
            if(await managedb.connectToACollection('accounts')===1){await managedb.close();response.writeHead(502, {'Content-Type': 'text/html'});response.end("database collection error");}
            if(pathname.endsWith('/register'))
            {
                let body="";
                request.on("data", function (chunk) {
                    body += chunk;
                });
                request.on("end",async function(){
                    var json = JSON.parse(body);
                    console.log("id: "+json.mail +", password: "+ json.password +", name: "+ json.display_name);
                    var message = await managedb.registerUser(json.mail, json.password, json.display_name);
                    await managedb.close();
                    response.end(message);
                });
            }
            else
            {
                var mail = pathname.split('?');
                var message = await managedb.getUser(mail[1]);
                await managedb.close();
                response.end(message);
            }
        }
        else if(pathname.startsWith('/units'))
        {
            if(await managedb.connectToACollection('units')===1){await managedb.close();response.writeHead(502, {'Content-Type': 'text/html'});response.end("database collection error");}
            if(pathname.endsWith('/add'))   //post method: add 1 unit or some units, into db
            {
                let body="";
                request.on("data", function (chunk) {
                    body += chunk;
                });
                request.on("end",async function(){
                    
                });
            }
            else        //get method: retrieve unit info
            {
                var unit_id = pathname.split('?');
                var message = await managedb.getUnit(unit_id[1]);
                await managedb.close();
                response.end(message);
            }
        }
        await managedb.close();
    }

}).listen(8080);

console.log("in listening: http://localhost:8080");