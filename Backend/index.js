const http = require("http");
const url = require("url");
const hostname = "127.0.0.1";
const port = 3000;

const server = http.createServer((req, res) => {
console.log(req);
});

server.listen(port, hostname, () => {
    console.log("server running...");
});
