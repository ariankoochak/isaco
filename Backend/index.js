const http = require("http");
const url = require("url");
const hostname = "127.0.0.1";
const port = 3000;

const server = http.createServer((req, res) => {
console.log(req);
});

server.listen(port, hostname, () => {
    console.log("server running...");
    let sql = require("mssql");
    let config = {
        user: "isacoBackend",
        password: "78788989",
        server: "Arian",
        database: "isacoDB",
        options: {
            trustedConnection: true,
            encrypt: true,
            enableArithAbort: true,
            trustServerCertificate: true,
        },
    };
    
    sql.connect(config, function (err) {
        if (err) console.log(err);
        let request = new sql.Request();
        request.query(
            "select * from isaco.CarsList",
            function (err, recordset) {
                if (err) console.log(err);
                console.log(recordset);
            }
        );
    });
});
