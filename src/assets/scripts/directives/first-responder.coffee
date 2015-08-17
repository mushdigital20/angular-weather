
# @author Pedro Mello (MushDigital)
# @email: pedro@mushdigital.com
# @Date:   2015-08-14

#Sets initial focus to field

angular.module('app').directive 'firstResponder', ()->
	return {
		restrict: 'A'
		link: (scope, element)->
			element.focus()
	}