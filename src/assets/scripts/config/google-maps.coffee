angular.module('app').config (uiGmapGoogleMapApiProvider)->
	uiGmapGoogleMapApiProvider.configure {
        key: 'AIzaSyCc7e6tF2xHXwZSzeXStx4yr3MAKnKAOAs',
        v: '3.17',
        libraries: 'weather,geometry,visualization,places',
        streetViewControl: false
    }