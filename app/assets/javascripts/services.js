/* global app */
angular.module('services', ['ngResource'])
.factory('Book', ["$resource", function ($resource) {
  return $resource('/postgresql/book/:id', {}, {
    update: {method: 'PUT'}
  });
}]);