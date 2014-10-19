@app.controller 'HomeCtrl', ['$scope', '$http', '$location', ($scope, $http, $location) ->
  $scope.players = []
  $http.get('./players.json').success((data) ->
    $scope.players = data
  )

  $scope.viewPlayer = (id) ->
    $location.url "/players/#{id}"
]