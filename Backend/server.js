var express = require("express");
var app = express();

app.get("/", function (req, res) {
    var sql = require("mssql");
    var config = {
        user: "HajiBackende",
        password: "123",
        server: "Arian",
        database: "isacoDB",
    };
    sql.connect(config, function (err) {
        if (err) console.log(err);
        var request = new sql.Request();
        request.query("select * from isaco.CarsList", function (err, recordset) {
            if (err) console.log(err);
            res.send(recordset);
        });
    });
});

var server = app.listen(5000, function () {
    console.log("Server is running..");
});
