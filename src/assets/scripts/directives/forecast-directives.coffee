angular.module('app').directive 'forecastDay' , () ->
	return {
		restrict: 'E'
		templateUrl: '../../../views/directives/forecast-day.ejs',
		replace: true
		scope: {
			result: "="
			convert: "&"
			date: "="
		}
	}