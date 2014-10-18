@app.controller 'PlayerIndexCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.players = []
  $http.get('./players.json').success((data) ->
    $scope.players = data
  )

  $scope.viewPlayer = (id) ->
    $location.url "/players/#{id}"

  $scope.orderProp = 'name';
]