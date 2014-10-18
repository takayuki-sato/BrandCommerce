@app.filter 'number', ->
  (input) ->
    return '# ' + input