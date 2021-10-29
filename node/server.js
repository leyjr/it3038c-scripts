var fs = require("fs");
var http = require("http");
var ip = require('ip');
var os = require("os");
const { uptime } = require("process");
//const os = require("os");

function getUptime() {
    uptimes = os.uptime();
    days = Math.floor(uptimes / 86400);
    hours = Math.floor(uptimes % 86400 / 3600);
    minuets = Math.floor(uptimes % 86400 % 3600 / 60);
    seconds = Math.floor(uptimes % 86400 % 3600 % 60);
    return "Days " + days + " Hours " + hours + " Minuets " + minuets + " Seconds" + seconds
}

function getTotalMemory() {
    totalMemory = os.totalmem();
    return totalMemory / 1000000 + " MB"
}

function getFreeMemory() {
    freeMemory = os.freemem();
    return freeMemory / 1000000 + " MB"
}

function getCPUs() {
    cpuCount = os.cpus().length;
    return cpuCount
}


var server = http.createServer(function(req, res){
    if (req.url === "/") {
        fs.readFile("./public/index.html", "UTF-8", function(err, body){
            res.writeHead(200, {"Content-Type":"text/html"});
            res.end(body);
        });
    }

    else if(req.url.match("/sysinfo")) {
        myHostName=os.hostname();
        html = `
        <!DOCTYPE html>
            <html>
                <head>
                    <title>Node JS Response</title>
                    <body>
                        <p>Hostname: ${myHostName}</p>
                        <p>IP: ${ip.address()}</p>
                        <p>Server Uptime: ${getUptime()}</p>
                        <p>Total Memory: ${getTotalMemory()}</p>
                        <p>Free Memory: ${getFreeMemory()}</p>
                        <p>Number of CPUs: ${getCPUs()}</p>
                    </body>
                </head>
            </html>
        `
        res.writeHead(200, {"Content-Type":"text/html"});
        res.end(html);
    }
    else {
        res.writeHead(404, {"Content-Type": "text/html"});
        res.end(`404 file not found at ${req.url}`);
    }
});

server.listen(3000)

console.log("Server listening on port 3000");