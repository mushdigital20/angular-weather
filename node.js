// Generated by CoffeeScript 1.9.3

/**
 * @author Pedro Mello (MushDigital)
 * @email: pedro@mushdigital.com
 * @Date:   2015-08-14
 */

(function() {
  var app, assets_path, compiler, engine, express, fs, package_json, path, port, webpack, webpack_config, webpack_middleware, webpack_server;

  express = require('express');

  webpack_middleware = require('webpack-dev-middleware');

  webpack = require('webpack');

  webpack_server = require('webpack-dev-server');

  webpack_config = require('./config/webpack.config.js');

  path = require('path');

  fs = require('fs');

  package_json = require('./package.json');

  engine = require('ejs-locals');

  app = express();

  assets_path = path.resolve(__dirname, 'src');

  port = 8080;

  app.engine('ejs', engine);

  app.set('view engine', 'ejs');

  app.set('views', './src/views');

  app.get('/', function(req, res) {
    return res.render('index', {
      page_title: "Angular.js Weather Forecast",
      author: package_json.author
    });
  });

  app.use(express["static"](assets_path));

  compiler = webpack(webpack_config);

  app.use(webpack_middleware(compiler, {}));

  app.listen(port, 'localhost', function() {
    return console.log("Server started on " + port);
  });

}).call(this);
