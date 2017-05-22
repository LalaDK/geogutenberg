/* global app */
angular.module('mongodbServices', ['ngResource'])
.factory('MongodbBook', ["$resource", function ($resource) {
    return $resource('/mongodb/book/:id', {}, {
      byCityId: {method: 'GET', isArray: true, url: '/mongodb/booksByCity'},
      byLocation: {method: 'GET', isArray: true, url: '/mongodb/booksByLocation'},
      byAuthor: {method: 'GET', isArray: true, url: '/mongodb/booksByAuthor'}
    });
  }])
.factory('MongodbCity', ["$resource", function ($resource) {
    return $resource('/mongodb/city/:id', {}, {
    })
  }])
.factory('MongodbAuthor', ["$resource", function ($resource) {
    return $resource('/mongodb/author/:id', {}, {
    })
  }]);;