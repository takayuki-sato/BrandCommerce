@app.controller 'PlayerShowCtrl', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->
  $http.get("./players/#{$routeParams.id}.json").success((data) ->
    $scope.player = data
  )
]