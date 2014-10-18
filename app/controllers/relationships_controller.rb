class RelationshipsController < ApplicationController
  before_action :signed_in_user

  def create
    @player = Player.find(params[:player_id])
    current_user.follow!(@player)
    redirect_to @player
  end

  def destroy
    @player = Relationship.find(params[:id]).player
    current_user.unfollow!(@player)
    redirect_to @player
  end
end