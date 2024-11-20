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
    @booking.stone = @stone
    @booking.user = current_user
    @booking.price = 333
    @booking.status ="Planned"
    if @booking.save
      redirect_to root_path
    else
      raise
      render "stones/show", status: :unprocessable_entity
    end
  end

  def show
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
