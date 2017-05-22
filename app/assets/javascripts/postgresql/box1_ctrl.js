app.controller('box1Ctrl', ["$scope", "PostgresqlCity", "PostgresqlBook",
  function ($scope, PostgresqlCity, PostgresqlBook) {
    $scope.city = null;
    $scope.books = [];

    $scope.getCity = function (searchStr) {
      return PostgresqlCity.query({search: searchStr}).$promise;
    };

    $scope.onCitySelected = function (city) {
      $scope.city = city;
      $scope.books = PostgresqlBook.byCityId({city_id: $scope.city.id});
    };
  }]);