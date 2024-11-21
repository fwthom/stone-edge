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
    start_date = Date.parse(params[:booking][:start_date]) 
    end_date = Date.parse(params[:booking][:end_date])  
    duration = (end_date - start_date).to_i 
    @booking.price = @stone.daily_price * duration
    @booking.status ="Submitted"
    raise
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
