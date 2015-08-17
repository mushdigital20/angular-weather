###*
 * @author Pedro Mello (MushDigital)
 * @email: pedro@mushdigital.com
 * @Date:   2015-08-16
###

require 'bootstrap-webpack'
require 'font-awesome-webpack'
require 'lodash'
require 'angular'
require 'angular-route'
require 'angular-resource'
require 'angular-sanitize'
require 'angular-cookies'
require 'angular-google-maps'
require '!style!css!less!./assets/styles/application.css.less'
require 'angular-ui-bootstrap'

#style!css!less
app = angular.module('app', ['ngRoute','ngResource','ngSanitize','ngCookies','uiGmapgoogle-maps','ui.bootstrap'])

#Configs
configs = require.context('./assets/scripts/config', true, /.coffee$/);
configs.keys().forEach(configs);

#Services
services = require.context('./assets/scripts/services', true, /.coffee$/);
services.keys().forEach(services);

#Directives
directives = require.context('./assets/scripts/directives', true, /.coffee$/);
directives.keys().forEach(directives);

#Filters
filters = require.context('./assets/scripts/filters', true, /.coffee$/);
filters.keys().forEach(filters);

#Controllers
controllers = require.context('./assets/scripts/controllers', true, /.coffee$/);
controllers.keys().forEach(controllers);