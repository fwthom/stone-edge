class StonesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @stones = Stone.all

    @markers = @stones.geocoded.map do |stone|
      {
        lat: stone.latitude,
        lng: stone.longitude
      }
    end
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

    def edit
      @stone = Stone.find(params[:id])
    end

    def update
      @stone = Stone.find(params[:id])
      if @stone.update(stone_params)
        redirect_to @stone, notice: 'La pierre a été mise à jour avec succès.'
      else
        render :edit
      end
    end

    def destroy
      @stone = Stone.find(params[:id])
      if @stone.destroy
        redirect_to dashboard_path, notice: 'Une amie supprimée'
      else
        redirect_to dashboard_path, alert: 'Suppression impossible.'
      end
    end

  private

  def stone_params
    params.require(:stone).permit(:name, :size, :condition, :backstory, :daily_price, :personnality_traits, :photo, :category_id)
  end
end
