@app = angular.module('brandcommerce', [])

@brandcommerce.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.
  otherwise({
      templateUrl: '../../views/static_pages/index.html.erb',
      controller: 'HomeCtrl'
    })
])