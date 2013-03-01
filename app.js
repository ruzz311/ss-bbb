// BackboneBoilerplate / SocketStream 0.3 app

var i, c, server, createRoute, consoleServer,
    http = require('http'),
    ss = require('socketstream'),
    config = require('./server/config/app.json');

// Define clients dynamically by adding them in the config.json.
function createRoute(client) {
  ss.http.route(client.route, function(req, res){ 
    res.serveClient(client.name) 
  });
}
  
for (i in config.clients) {
  c = config.clients[i];
  // Define a client.
  ss.client.define( c.name, { 
    view:c.view, css:c.css, code:c.code, tmpl:c.tmpl 
  });
  // Attach a client to it's defined route.
  createRoute(c);
}

// Code Formatters / Template Engine
ss.client.formatters.add(require('ss-coffee'));
ss.client.formatters.add(require('ss-jade'));
ss.client.formatters.add(require('ss-stylus'));
ss.client.templateEngine.use(require('ss-handlebars'));

// Minimize and pack assets if you type: SS_ENV=production node app.js
if (ss.env === 'production') 
  ss.client.packAssets();

// Start web server
server = http.Server(ss.http.middleware);
server.listen(3000);

// Start Console Server (REPL)
// To install client: sudo npm install -g ss-console
// To connect: ss-console <optional_host_or_port>
if (ss.env !== 'production') 
  consoleServer = require('ss-console')(ss);
  consoleServer.listen(5000);

// Start SocketStream
ss.start(server);