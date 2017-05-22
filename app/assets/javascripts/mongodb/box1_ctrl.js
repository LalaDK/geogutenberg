app.controller('box1Ctrl', ["$scope", "MongodbCity", "MongodbBook",
  function ($scope, MongodbCity, MongodbBook) {
    $scope.city = null;
    $scope.books = [];

    $scope.getCity = function (searchStr) {
      return MongodbCity.query({search: searchStr}).$promise;
    };

    $scope.onCitySelected = function (city) {
      $scope.city = city;
      $scope.books = MongodbBook.query({city_id: $scope.city.id});
    };
  }]);