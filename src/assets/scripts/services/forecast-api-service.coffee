###*
 * @author Pedro Mello (MushDigital)
 * @email: pedro@mushdigital.com
 * @Date:   2015-08-16
###

#Provides connection with openweathermap
class ForecastAPIService
	constructor: ($resource)->
		@city = ''
		#Start resource		
		@resource = $resource('http://api.openweathermap.org/data/2.5/forecast/daily',{callback: "JSON_CALLBACK"},{get:{method:"JSONP"}})

	getWeather: (city)->
		#returns the results by city
		return @resource.get({q:city})

angular.module('app').service('forecastAPIService', ['$resource',ForecastAPIService])