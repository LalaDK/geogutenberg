/* global app */

app.controller('mongodbCtrl', ["$scope", "$q", "MongodbBook",
  function ($scope, $q, MongodbBook) {
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
      MongodbBook.byCityId({id: 21874}, function () {
        query1times.push(((new Date().getTime()) - query1startTime) / 1000);
        MongodbBook.byCityId({id: 5391}, function () {
          query1times.push((new Date().getTime() - query1startTime) / 1000);
          MongodbBook.byCityId({id: 7572}, function () {
            query1times.push(((new Date().getTime() - query1startTime) / 1000));
            MongodbBook.byCityId({id: 20967}, function () {
              query1times.push(((new Date().getTime() - query1startTime) / 1000));
              MongodbBook.byCityId({id: 15394}, function () {
                $scope.query1result = (((new Date().getTime() - query1startTime)  / 1000));
                query1times.push(((new Date().getTime() - query1startTime) / 1000));
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
        MongodbBook.get({id: "5923275b7cbab17891ff90c4"}, function () {
          query2times.push((new Date().getTime() - query2startTime) / 1000);
          MongodbBook.get({id: "5923275b7cbab17891ff9363"}, function () {
            query2times.push((new Date().getTime() - query2startTime) / 1000);
            MongodbBook.get({id: "592327657cbab17891ffe0ea"}, function () {
              query2times.push((new Date().getTime() - query2startTime) / 1000);
              MongodbBook.get({id: "5923276d7cbab178910022e5"}, function () {
                query2times.push((new Date().getTime() - query2startTime) / 1000);
                MongodbBook.get({id: "592327917cbab17891015321"}, function () {
                  query2times.push((new Date().getTime() - query2startTime) / 1000);
                  $scope.query2result = ((new Date().getTime() - query2startTime) / 1000);
                  $scope.query2average = avg(query2times);
                  $scope.query2median = median(query2times);
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
        MongodbBook.byAuthor({id: "Henry James"}, function () {
          query3times.push((new Date().getTime() - query3startTime) / 1000);
          MongodbBook.byAuthor({id: "William Morris"}, function () {
            query3times.push((new Date().getTime() - query3startTime) / 1000);
            MongodbBook.byAuthor({id: "William Shakespeare"}, function () {
              query3times.push((new Date().getTime() - query3startTime) / 1000);
              MongodbBook.byAuthor({id: "Theodor Hertzka"}, function () {
                query3times.push((new Date().getTime() - query3startTime) / 1000);
                MongodbBook.byAuthor({id: "Vernon Lee"}, function () {
                  query3times.push((new Date().getTime() - query3startTime) / 1000);
                  $scope.query3result = ((new Date().getTime() - query3startTime) / 1000);
                  $scope.query3average = avg(query3times);
                  $scope.query3median = median(query3times);
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
        var location1 = {latitude: 55.73948169869349, longitude: 12.524414062500002, radius: 20};
        var location2 = {latitude: 51.6180165487737, longitude: -0.3515625, radius: 20};
        var location3 = {latitude: 48.88639177703194, longitude: 2.2741699218750004, radius: 20};
        var location4 = {latitude: 40.75557964275589, longitude: -74.03686523437501, radius: 20};
        var location5 = {latitude: 53.54030739150022, longitude: 10.019531250000002, radius: 20};
        MongodbBook.byLocation(location1, function () {
          query4times.push((new Date().getTime() - query4startTime) / 1000);
          MongodbBook.byLocation(location2, function () {
            query4times.push((new Date().getTime() - query4startTime) / 1000);
            MongodbBook.byLocation(location3, function () {
              query4times.push((new Date().getTime() - query4startTime) / 1000);
              MongodbBook.byLocation(location4, function () {
                query4times.push((new Date().getTime() - query4startTime) / 1000);
                MongodbBook.byLocation(location5, function () {
                  query4times.push((new Date().getTime() - query4startTime) / 1000);
                  $scope.query4result = ((new Date().getTime() - query4startTime) / 1000);
                  $scope.query4average = avg(query4times);
                  $scope.query4median = median(query4times);
                  $scope.query4status = "Done";
                  query4promise.resolve();
                });
              });
            });
          });
        });

        query4promise.promise.then(function () {
          $scope.testRunning = false;
          $scope.totalTime = $scope.query1result + $scope.query2result + $scope.query3result + $scope.query4result;
        });
      });
    };

    function avg(arr) {
      console.log(arr);
      var sum = 0;
      arr.forEach(function(val) {
        sum += val;
      });
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