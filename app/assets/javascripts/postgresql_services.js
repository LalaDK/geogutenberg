/* global app */
angular.module('postgresqlServices', ['ngResource'])
.factory('PostgresqlBook', ["$resource", function ($resource) {
    return $resource('/postgresql/book/:id', {}, {
      byCityId: {method: 'GET', isArray: true, url: '/postgresql/booksByCity'},
      byLocation: {method: 'GET', isArray: true, url: '/postgresql/booksByLocation'}
    });
  }])
.factory('PostgresqlCity', ["$resource", function ($resource) {
    return $resource('/postgresql/city/:id', {}, {
      byBook: {method: 'GET', isArray: true, url: '/postgresql/citiesByBook'}
    });
  }])
.factory('PostgresqlAuthor', ["$resource", function ($resource) {
    return $resource('/postgresql/author/:id', {}, {
    });
  }]);;