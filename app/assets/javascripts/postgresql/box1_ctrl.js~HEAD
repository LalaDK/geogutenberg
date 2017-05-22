app.controller('box1Ctrl', ["$scope", "City", "Occurrence", "Book",
  function ($scope, City, Occurrence, Book) {
    $scope.city = null;
    $scope.books = [];

    $scope.getCity = function (searchStr) {
      return City.query({search: searchStr}).$promise;
    };

    $scope.onCitySelected = function (city) {
      $scope.city = city;
      $scope.books = Book.byCityId({city_id: $scope.city.id});
    };
  }]);