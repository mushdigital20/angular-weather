###*
 * @author Pedro Mello (MushDigital)
 * @email: pedro@mushdigital.com
 * @Date:   2015-08-14
###

angular.module('app').controller('forecastController', ['$scope','$cookies','forecastAPIService','temperatureCalculatorService','uiGmapGoogleMapApi', ($scope,$cookies,forecastAPIService,temperatureCalculatorService,uiGmapGoogleMapApi) ->

	$scope.results = {}
	$scope.temperatureUnit = if $cookies.get('temperatureUnit')? then $cookies.get('temperatureUnit') else "celsius"
	$scope.date = new Date().getTime()

	#form submit
	$scope.submit = () ->
		if $scope.form.$valid
			$scope.forecast()
			
	#requests the weather information from the API
	$scope.forecast = () ->
		forecastAPIService.getWeather($scope.city).$promise.then (json) ->
			if(json.cod == '200')
				$scope.centerMap json.city.coord, 8 #centers the maps of the selected city
				$scope.results = json.list #sets the list with the forecast results
				$cookies.putObject('city', {name:$scope.city,coords:json.city.coord})
				
				console.log $cookies.get('city')
			else
				$scope.results = {}

	$scope.setTemperatureUnit = (temp) ->
		$scope.temperatureUnit = temp
		$cookies.put('temperatureUnit', temp)


	#TODO: more interactivity with google maps
	uiGmapGoogleMapApi.then (maps) ->
		#maps.places.AutocompleteService()

	#Centers the map to the coords and zoom
	$scope.centerMap = (coords, zoom) ->
		$scope.map = {center:{latitude: coords.lat, longitude: coords.lon}, zoom: zoom}

	$scope.convertTemperature = (temp) ->
		temperatureCalculatorService.calculate(temp, $scope.temperatureUnit)

	if $cookies.getObject('city')?
		$scope.city = $cookies.getObject('city').name
		$scope.forecast() #starts the forecast with the last city
	else
		$scope.city = ''
		#Map initial position (todo:cookies)
		$scope.centerMap { lat: 45, lon: -73 }, 2 #ini
])
