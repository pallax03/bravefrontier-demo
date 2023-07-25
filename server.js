const http = require('http');
const managedb = require('./managedb');

http.createServer( async function (request, response) {
    response.writeHead(200, {'Content-Type': 'text/html'});

    let url = request.url.split('/');
    if(url[1]==='')
    {

    }
    else
    {
        await managedb.connect();
        var temp = url[1].split('?'); //sistemare qua
        await managedb.connectToACollection(temp[0]);
        switch (temp[0]) {
            case 'accounts':        //POST - GET FOR ACCOUNTS 
                if(request.method === 'POST')
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
                    // user info
                    var mail = request.url.searchParams.get('mail');
                    var message = await managedb.getUser(mail);
                    await managedb.close();
                    response.end(message);
                }
                break;
        }
        await managedb.close();
    }

}).listen(8080);

console.log("in listening: http://localhost:8080");