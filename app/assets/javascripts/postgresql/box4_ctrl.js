app.controller('box4Ctrl', ["$scope", "Book",
  function ($scope, Book) {
    $scope.radius = 200;
    $scope.radiuses = [1, 2, 3, 5, 10, 25, 50, 75, 100, 150, 200];
    $scope.occurrences = [];
    var map;
    var circle;
    
    $scope.init = function () {
      map = L.map('box4_map').setView([55.67594, 12.56553], 6);
      map.on('click', onMapClicked)
      resetMap();
    };

    function onMapClicked(evt) {
      var location = {latitude: evt.latlng.lat, longitude: evt.latlng.lng, radius: $scope.radius};
      $scope.occurrences = Book.byLocation(location);
      drawCircle(location.latitude, location.longitude, $scope.radius * 1000);
    }

    function drawCircle(latitude, longitude, radius) {
      resetMap();
      circle = L.circle([latitude, longitude], {
        color: 'red',
        fillColor: '#f03',
        fillOpacity: 0.5,
        radius: radius || 1000
      }).addTo(map);
    }

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