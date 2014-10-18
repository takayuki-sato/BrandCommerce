@app.controller 'HomeCtrl', ['$scope', 'Players', ($scope, Players) ->
  $scope.foo = 'bar'
  $scope.players = Players.query()
]