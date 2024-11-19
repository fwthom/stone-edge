class StonesController < ApplicationController
  def index
    @stones = Stone.all
  end

  def show
    @stone = Stone.find(params[:id])
  end


  def stone_params
    params.require(:stone).permit(:name, :backstory, :daily_price, :personality_traits, :condition, :size, :image_url, :user_id, :category_id)
  end
end
