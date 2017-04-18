function showLoading() {
  $("#loading-container, #loading").show();
};

function hideLoading() {
  $("#loading-container, #loading").hide();
};

var app = angular.module('geogutenberg', ['ui.bootstrap', 'services', ['$httpProvider', '$provide', function($httpProvider, $provide) {
    $provide.factory('interceptor', ["$q", function($q) {
    return {
      'request': function(config) {
        showLoading();
        return config;
      },
      'requestError': function(rejection)  {
        hideLoading();
        return $q.reject(rejection);
      },
      'response': function(response) {
        hideLoading();
        return response;
      },
      'responseError': function(rejection) {
        hideLoading();
        return $q.reject(rejection);
      }
    };
  }]);
  $httpProvider.interceptors.push('interceptor');
  $httpProvider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
}]]);