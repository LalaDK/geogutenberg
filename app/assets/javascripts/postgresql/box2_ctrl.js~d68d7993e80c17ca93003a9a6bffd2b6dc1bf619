// http://leafletjs.com/examples/quick-start/
app.controller('box2Ctrl', ["$scope", "Book", function ($scope, Book) {
    $scope.cities = [];
    $scope.book = null;
    var map;

    $scope.init = function () {
      map = L.map('box2_map').setView([55.67594, 12.56553], 6);
      resetMap();
    };

    $scope.getBooks = function (searchStr) {
      return Book.query({search: searchStr}).$promise;
    };

    $scope.onBookSelected = function (book) {
      Book.get({id: book.id}, function (data) {
        $scope.book = data;
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