class StonesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @stones = Stone.all
  end

  def show
    @stone = Stone.find(params[:id])
    @booking = Booking.new
    @bookings = @stone.bookings
    @bookings_dates = @bookings.map do |booking|
      {
        from: booking.start_date,
        to:   booking.end_date
      }
    end
  end

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
