app.controller('box3Ctrl', ["$scope", "PostgresqlAuthor",
  function ($scope, PostgresqlAuthor) {
    $scope.data = null;
    var map;

    $scope.init = function () {
      map = L.map('box3_map').setView([55.67594, 12.56553], 6);
      resetMap();
    };

    $scope.getAuthors = function (searchStr) {
      return PostgresqlAuthor.query({search: searchStr}).$promise;
    };

    $scope.onAuthorSelected = function (author) {
      $scope.data = PostgresqlAuthor.get({id: author.id});
    };

    $scope.showOccurrences = function (book) {
      var markers = (book || []).map(function (city) {
        console.log(city)
        var description = city[1] + " (occurrences: " + city[0] + ")"
        return {
          lat: city[3],
          lon: city[4],
          title: description,
          alt: description
        };
      });
      drawMarkers(markers);
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