/* global app */
angular.module('services', ['ngResource'])
.factory('Book', ["$resource", function ($resource) {
    return $resource('/postgresql/book/:id', {}, {
      byCityId: {method: 'GET', isArray: true, url: '/postgresql/booksByCity'},
      byLocation: {method: 'GET', isArray: true, url: '/postgresql/booksByLocation'}
    });
  }])
.factory('City', ["$resource", function ($resource) {
    return $resource('/postgresql/city/:id', {}, {
    })
  }])
.factory('Occurrence', ["$resource", function ($resource) {
    return $resource('/postgresql/occurrence/:id', {}, {
    })
  }])
.factory('Author', ["$resource", function ($resource) {
    return $resource('/postgresql/author/:id', {}, {
    })
  }]);;