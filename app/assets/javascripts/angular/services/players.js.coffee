@app.factory 'Players', ['$resource', ($resource) ->
    $resource '/players/index'
  ]