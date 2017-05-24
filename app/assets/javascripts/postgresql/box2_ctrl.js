// http://leafletjs.com/examples/quick-start/
app.controller('box2Ctrl', ["$scope", "PostgresqlBook", "PostgresqlCity", 
  function ($scope, PostgresqlBook, PostgresqlCity) {
    $scope.cities = [];
    $scope.book = null;
    var map;

    $scope.init = function () {
      map = L.map('box2_map').setView([55.67594, 12.56553], 6);
      resetMap();
    };

    $scope.getBooks = function (searchStr) {
      return PostgresqlBook.query({search: searchStr}).$promise;
    };

    $scope.onBookSelected = function (book) {
      PostgresqlCity.byBook({id: book.id}, function (data) {
        $scope.cities = data;
        var markers = (data || []).map(function (city) {
          var description = city[3] + " (occurrences: " + city[0] + ")"
          return {
            lat: city[4],
            lon: city[5],
            title: description,
            alt: description
          };
        });
        drawMarkers(markers);
      });
    };

    $scope.goToLocation = function (latitude, longitude) {
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