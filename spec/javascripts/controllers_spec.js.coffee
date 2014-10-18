describe "BrandCommerce controllers", ->
  beforeEach module("brandcommerce")

  describe "PlayersIndexCtrl", ->
    it "should set players to an empty array", inject(($controller) ->
      scope = {}
      ctrl = $controller("PlayersIndexCtrl",
        $scope: scope
      )
      expect(scope.players.length).toBe 0
    )