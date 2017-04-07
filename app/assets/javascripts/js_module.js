var app = angular.module('geogutenberg', ['ui.bootstrap', 'services', ['$httpProvider', '$provide', function($httpProvider, $provide) {
    $provide.factory('interceptor', ["$q", function($q) {
    return {
      'request': function(config) {
        return config;
      },
      'requestError': function(rejection) {
        App.handleError(rejection);
        return $q.reject(rejection);
      },
      'response': function(response) {
        return response;
      },
      'responseError': function(rejection) {
        App.handleError(rejection);
        return $q.reject(rejection);
      }
    };
  }]);
  $httpProvider.interceptors.push('interceptor');
  $httpProvider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
}]]);