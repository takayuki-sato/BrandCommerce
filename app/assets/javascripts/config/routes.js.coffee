@app.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.
    when('/players', {
      templateUrl: '../templates/players/index.html.slim',
      controller: 'PlayerIndexCtrl'
    }).
    when('/players/:id', {
      templateUrl: '../templates/players/show.html',
      controller: 'PlayerShowCtrl'
    }).
    otherwise({
      templateUrl: '../templates/home.html',
      controller: 'HomeCtrl'
    })
])