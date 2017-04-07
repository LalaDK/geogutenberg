// http://leafletjs.com/examples/quick-start/
var map;
app.controller('ctrl', ["$scope", "Book", function ($scope, Book) {
    $scope.books = [];
    $scope.cities = [];
    $scope.currentBook = null;

    $scope.init = function () {
      map = L.map('city_mapid').setView([55.67594, 12.56553], 6);
      $scope.getBooks();
      resetMap();
    };


    $scope.getBooks = function () {
      $scope.books = Book.query();
    };

    $scope.showBook = function (book) {
      Book.get({id: book.id}, function (data) {
        $scope.currentBook = data;
        var markers = (data.occurrences || []).map(function (occurence) {
          var description = occurence.city.name + " (occurrences: " + occurence.count + ")"
          return {
            lat: occurence.city.latitude,
            lon: occurence.city.longitude,
            title: description,
            alt: description
          };
        });
        drawMarkers(markers);
      });
    };

    $scope.goToLocation = function(latitude, longitude) {
      map.setView([latitude, longitude], 7);
    };

    function drawMarkers(arr) {
      resetMap();
      for (var i = 0; i < arr.length; i++) {
        var marker = L.marker([arr[i].lat, arr[i].lon], arr[i]);
        marker.bindPopup(arr[i].title).openPopup();

        marker.addTo(map);
      }
      map.fitBounds(arr.map(function (a) {
        return [a.lat, a.lon]
      }));
    }

    function resetMap() {
      map.eachLayer(function (layer) {
        map.removeLayer(layer);
      });
      L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {}).addTo(map);
    }
  }]);