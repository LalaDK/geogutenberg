app.controller('box1Ctrl', ["$scope", "City", "Occurrence",
  function ($scope, City, Occurrence) {
    $scope.city = null;
    $scope.occurrences = [];

    $scope.getCity = function (searchStr) {
      return City.query({search: searchStr}).$promise;
    };

    $scope.onCitySelected = function (city) {
      $scope.city = city;
      $scope.occurrences = Occurrence.query({city_id: $scope.city.id});
    };
  }]);