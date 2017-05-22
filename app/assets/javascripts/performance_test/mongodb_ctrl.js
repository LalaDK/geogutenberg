/* global app */

app.controller('mongodbCtrl', ["$scope", "$q", "MongodbBook", "MongodbAuthor",
  function ($scope, $q, Book, Author) {
    $scope.testRunning = false;
    $scope.totalTime = " - ";
    $scope.query1result = " - ";
    $scope.query2result = " - ";
    $scope.query3result = " - ";
    $scope.query4result = " - ";
    $scope.query1average = " - ";
    $scope.query2average = " - ";
    $scope.query3average = " - ";
    $scope.query4average = " - ";
    $scope.query1median = " - ";
    $scope.query2median = " - ";
    $scope.query3median = " - ";
    $scope.query4median = " - ";
    $scope.query1status = "Not running";
    $scope.query2status = "Not running";
    $scope.query3status = "Not running";
    $scope.query4status = "Not running";
/*
    $scope.startTest = function () {
      $scope.testRunning = true;
      var query1promise = $q.defer();
      var query2promise = $q.defer();
      var query3promise = $q.defer();
      var query4promise = $q.defer();

      // Query 1
      $scope.query1status = "Running";
      var query1times = [];
      var query1startTime = new Date().getTime();
      Occurrence.query({city_id: 21874}, function () {
        query1times.push((query1startTime - new Date().getTime()) / 1000);
        Occurrence.query({city_id: 5391}, function () {
          query1times.push((query1startTime - new Date().getTime()) / 1000);
          Occurrence.query({city_id: 7572}, function () {
            query1times.push((query1startTime - new Date().getTime()) / 1000);
            Occurrence.query({city_id: 20967}, function () {
              query1times.push((query1startTime - new Date().getTime()) / 1000);
              Occurrence.query({city_id: 15394}, function () {
                $scope.query1 = (query1startTime - new Date().getTime()) / 1000;
                query1times.push((query1startTime - new Date().getTime()) / 1000);
                $scope.query1average = avg(query1times);
                $scope.query1median = median(query1times);
                $scope.query1status = "Done";
                query1promise.resolve();
              });
            });
          });
        });
      });

      // Query 2
      query1promise.promise.then(function () {
        $scope.query2status = "Running";
        var query2times = [];
        var query2startTime = new Date().getTime();
        Book.get({id: book_id}, function () {
          query2times.push((query2startTime - new Date().getTime()) / 1000);
          Book.get({id: book_id}, function () {
            query2times.push((query2startTime - new Date().getTime()) / 1000);
            Book.get({id: book_id}, function () {
              query2times.push((query2startTime - new Date().getTime()) / 1000);
              Book.get({id: book_id}, function () {
                query2times.push((query2startTime - new Date().getTime()) / 1000);
                Book.get({id: book_id}, function () {
                  query2times.push((query2startTime - new Date().getTime()) / 1000);
                  $scope.query2 = (query2startTime - new Date().getTime()) / 1000;
                  $scope.query2average = avg(query1times);
                  $scope.query2median = median(query1times);
                  $scope.query2status = "Done";
                  query2promise.resolve();
                });
              });
            });
          });
        });
      });

      // Query 3
      query2promise.promise.then(function () {
        $scope.query3status = "Running";
        var query3times = [];
        var query3startTime = new Date().getTime();
        Author.get({id: author.id}, function () {
          query3times.push((query3startTime - new Date().getTime()) / 1000);
          Author.get({id: author.id}, function () {
            query3times.push((query3startTime - new Date().getTime()) / 1000);
            Author.get({id: author.id}, function () {
              query3times.push((query3startTime - new Date().getTime()) / 1000);
              Author.get({id: author.id}, function () {
                query3times.push((query3startTime - new Date().getTime()) / 1000);
                Author.get({id: author.id}, function () {
                  query3times.push((query3startTime - new Date().getTime()) / 1000);
                  $scope.query3 = (query3startTime - new Date().getTime()) / 1000;
                  $scope.query3average = avg(query1times);
                  $scope.query3median = median(query1times);
                  $scope.query3status = "Done";
                  query3promise.resolve();
                });
              });
            });
          });
        });
      });

      // Query 4
      query3promise.promise.then(function () {
        $scope.query4status = "Running";
        var query4times = [];
        var query4startTime = new Date().getTime();
        var location1 = {latitude: 55.73948169869349, longitude: 12.524414062500002, radius: 200};
        var location2 = {latitude: 51.6180165487737, longitude: -0.3515625, radius: 200};
        var location3 = {latitude: 48.88639177703194, longitude: 2.2741699218750004, radius: 100};
        var location4 = {latitude: 40.75557964275589, longitude: -74.03686523437501, radius: 100};
        var location5 = {latitude: 53.54030739150022, longitude: 10.019531250000002, radius: 50};
        Book.byLocation(location1, function () {
          query4times.push((query4startTime - new Date().getTime()) / 1000);
          Book.byLocation(location2, function () {
            query4times.push((query4startTime - new Date().getTime()) / 1000);
            Book.byLocation(location3, function () {
              query4times.push((query4startTime - new Date().getTime()) / 1000);
              Book.byLocation(location4, function () {
                query4times.push((query4startTime - new Date().getTime()) / 1000);
                Book.byLocation(location5, function () {
                  query4times.push((query4startTime - new Date().getTime()) / 1000);
                  $scope.query4 = (query4startTime - new Date().getTime()) / 1000;
                  $scope.query4average = avg(query1times);
                  $scope.query4median = median(query1times);
                  $scope.query4status = "Done";
                  query4promise.resolve();
                });
              });
            });
          });
        });

        query4promise.promise.then(function () {
          $scope.testRunning = false;
          $scope.totalTime = $scope.query1 + $scope.query2 + $scope.query3 + $scope.query4;
        });
      });
    };
*/
    function avg(arr) {
      var sum = arr.reduce((previous, current) => current += previous);
      return sum / arr.length;
    }

    function median(arr) {
      var values = arr.sort((a, b) => a - b);
      var lowMiddle = Math.floor((values.length - 1) / 2);
      var highMiddle = Math.ceil((values.length - 1) / 2);
      var median = (values[lowMiddle] + values[highMiddle]) / 2;
      return median;
    }
  }]);