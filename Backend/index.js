const express = require("express");
const app = express();
const port = 3000;
const sql = require("mssql");
const configDB = require('./configDB')
const cors = require("cors");
app.use(cors());

app.get("/", (req, res) => {
    res.send("Hello World!");
});

app.get("/Login", (req, res) => {
    let LoginDatas = req._parsedUrl.query.split(":");
    console.log(`select * from LoginCheck(${LoginDatas[0]},${LoginDatas[1]})`);
    sql.connect(configDB, function (err) {
        if (err) console.log(err);
        let request = new sql.Request();
        request.query(
            `select * from LoginCheck('${LoginDatas[0]}','${LoginDatas[1]}')`,
            function (err, recordset) {
                if (err) console.log(err);
                if (typeof recordset.recordsets[0][0] !== "undefined")
                    res.send(recordset.recordsets[0][0]);
                else
                    res.status(401).end();
            }
        );
    });
});


app.listen(port, () => {
    console.log(`isaco app listening on port ${port}`);
});

