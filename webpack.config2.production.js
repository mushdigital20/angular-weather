var Webpack = require('webpack');
var path = require('path');
var nodeModulesPath = path.resolve(__dirname, 'node_modules');
var buildPath = path.resolve(__dirname, 'target');
var mainPath = path.resolve(__dirname, 'src', 'app.coffee');

var config = {
  
  // We change to normal source mapping, if you need them
  devtool: 'source-map',
  entry: mainPath,
  output: {
    path: buildPath,
    filename: 'bundle.js'
  },
  module: {
    loaders: [{
      test: /\.js$/,
      loader: 'babel',
      exclude: [nodeModulesPath]
    },{
      test: /\.css$/,
      loader: 'style!css'
    },
    {test: /\.coffee$/, loader: "coffee-loader"}]
  }
};

module.exports = config;