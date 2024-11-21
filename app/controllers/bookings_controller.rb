class BookingsController < ApplicationController
  before_action :set_stone, only: [:create, :new]
  def index
    @bookings = Bookings.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.stone = Stone.find(params[:stone_id])
    @booking.user = current_user

    if @booking.save
      redirect_to stone_path(@stone)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    raise
    set_booking
  end

  private
  def set_stone
    @stone = Stone.find(params[:stone_id])
  end

  def set__booking
    @booking = Booking.find(params[:booking_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
