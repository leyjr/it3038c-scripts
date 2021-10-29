var dns = require('dns');

function hostnameLookup(hostname) {
    dns.lookup(hostname, function(err, address, family){
        console.log(address);
    });

}

if (process.argv.length < 3) {
    console.log("USAGE: " + _filename + " hostname.com")
    Process.exit(-1)
}

var hostname =  process.argv[2]
console.log('Checking IP of: ${hostname}')
hostnameLookup(hostname)