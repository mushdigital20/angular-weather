angular.module('app')
.config ($routeProvider) ->
	$routeProvider
	.when '/', {
		templateUrl: 'views/pages/forecast.ejs'
		controller: 'forecastController'
		controllerAs: 'ctrl'
	}
	.otherwise {
		templateUrl: 'views/pages/forecast.ejs'
		controller: 'forecastController'
		controllerAs: 'ctrl'
	}