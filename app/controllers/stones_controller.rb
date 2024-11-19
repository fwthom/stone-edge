class StonesController < ApplicationController
  def new
    @stone = Stone.new
  end

  def create
    @stone = Stone.new(stone_params)

    if @stone.save
      redirect_to @stone, notice: 'Stone was successfully created.'
    else
      render :new
    end
  end

  private

  def stone_params
    params.require(:stone).permit(:name, :backstory, :daily_price,
      :personnality_traits, :condition, :size, :image_url, :user_id,
      :category_id, :created_at, :updated_at)
  end

end
