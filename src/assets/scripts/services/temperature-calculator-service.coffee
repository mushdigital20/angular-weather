###*
 * @author Pedro Mello (MushDigital)
 * @email: pedro@mushdigital.com
 * @Date:   2015-08-16
###

class TemperatureCalculatorService
	calculate : (kelvin, unit)->
		switch unit
			when 'celsius' 
				result = parseFloat(kelvin) - 273.15
				symbol = "&deg;C"
			when 'fahrenheit' 
				result = (1.8 * (parseFloat(kelvin) - 273)) + 32
				symbol = "&deg;F"
			when 'kelvin' 
				result = parseFloat(kelvin)
				symbol = "K"
			else
				result = parseFloat(kelvin) - 273.15
				symbol = "&deg;C"

		return "#{Math.round(result)}#{symbol}"

#Calculates a temperature from Kelvin to Celsius or Fahrenheit
angular.module('app').service('temperatureCalculatorService', TemperatureCalculatorService)