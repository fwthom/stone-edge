class StonesController < ApplicationController
  def new
    @stone = Stone.new
  end

  def create
    @stone = Stone.new(stone_params)
    @stone.user = current_user
    if @stone.save!
      redirect_to @stone, notice: 'Stone was successfully created.'
    else
      render :new
    end
  end




  private

  def stone_params
    params.require(:stone).permit(:name, :size, :condition, :backstory, :dailyprice, :personnality_traits, :photo, :category_id)
  end
end
