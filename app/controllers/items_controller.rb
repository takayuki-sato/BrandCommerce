class ItemsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
  end

  def create
    @player = Player.find(item_params[:player_id])
    @item = @player.items.build(item_params)
    if @item.save
      flash[:success] = "Item created!"
      redirect_to players_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @item.destroy
    redirect_to root_url
  end

  private

    def item_params
      params.require(:item).permit(:description, :player_id)
    end

    def correct_user
      redirect_to root_url unless current_user.admin?
    end
end