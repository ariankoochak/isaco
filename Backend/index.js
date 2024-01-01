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

app.get("/CarsType", (req, res) => {
    console.log(`select * from carsType`);
    sql.connect(configDB, function (err) {
        if (err) console.log(err);
        let request = new sql.Request();
        request.query(
            `select * from carsType`,
            function (err, recordset) {
                if (err) console.log(err);
                res.send(recordset.recordsets[0]);
            }
        );
    });
});

app.get("/CarModel", (req, res) => {
    let carModel = req._parsedUrl.query;
    console.log(`select * from getCarsNameByCarCategory('${carModel}')`);
    sql.connect(configDB, function (err) {
        if (err) console.log(err);
        let request = new sql.Request();
        request.query(`select * from getCarsNameByCarCategory('${carModel}')`, function (err, recordset) {
            if (err) console.log(err);
            res.send(recordset.recordsets[0]);
        });
    });
});

app.get("/CarColors", (req, res) => {
    let carModel = req._parsedUrl.query;
    console.log(`select * from getCarColorsByCarCategory('${carModel}')`);
    sql.connect(configDB, function (err) {
        if (err) console.log(err);
        let request = new sql.Request();
        request.query(
            `select * from getCarColorsByCarCategory('${carModel}')`,
            function (err, recordset) {
                if (err) console.log(err);
                res.send(recordset.recordsets[0][0].Colors.split(";"));
            }
        );
    });
});
app.post("/AddOrder", (req, res) => {
    let order = req._parsedUrl.query.split('?');
    order = order.map((data) => {return decodeURIComponent(data)});
    console.log(order);
    console.log(order[4]);
    console.log(
        `exec AddOrder '${order[3]}','${order[1]}','${order[2]}','${order[4]}','${order[5]}','${order[6]}','${order[7]}'`
    );
    sql.connect(configDB, function (err) {
        if (err) console.log(err);
        let request = new sql.Request();
        request.query(
            `exec AddOrder '${order[3]}',N'${order[1]}','${order[2]}',N'${order[4]}',N'${order[5]}','${order[6]}',N'${order[7]}'`,
            function (err, recordset) {
                if (err) console.log(err);
                res.status(200).end();
            }
        );
    });
});

app.get("/Orders", (req, res) => {
    console.log(`select * from ordersList`);
    sql.connect(configDB, function (err) {
        if (err) console.log(err);
        let request = new sql.Request();
        request.query(`select * from ordersList`, function (err, recordset) {
            if (err) console.log(err);
            res.send(recordset.recordsets)
        });
    });
});

app.get("/getServiceOrder", (req, res) => {
    let serviceName = req._parsedUrl.query;
    console.log(`select * from getOrdersByService(${serviceName})`);
    sql.connect(configDB, function (err) {
        if (err) console.log(err);
        let request = new sql.Request();
        request.query(
            `select * from getOrdersByService('${serviceName}')`,
            function (err, recordset) {
                if (err) console.log(err);
                console.log(recordset.recordset);
                res.send(recordset.recordset);
            }
        );
    });
});

app.get("/Employees", (req, res) => {
    console.log(`select * from employeeList`);
    sql.connect(configDB, function (err) {
        if (err) console.log(err);
        let request = new sql.Request();
        request.query(`select * from employeeList`, function (err, recordset) {
            if (err) console.log(err);
            res.send(recordset.recordsets);
        });
    });
});

app.listen(port, () => {
    console.log(`isaco app listening on port ${port}`);
});

