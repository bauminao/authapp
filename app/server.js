// curl -k https://localhost:8001/
const https = require('https');
const fs = require('fs');

const options = {
  key: fs.readFileSync('cert/key.pem'),
  cert: fs.readFileSync('cert/cert.pem')
};

https.createServer(options, (req, res) => {
  res.writeHead(200);
  res.end('hello world encrypted\n');
}).listen(8001);

