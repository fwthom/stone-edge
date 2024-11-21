class StonesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    search
    set_markers
  end

  def search
    @stones = Stone.all
    if params[:query].present? || params[:start_date].present? || params[:end_date].present?
      @stones = Stone.search_by_name_backstory_personnality(params[:query])
      
      if params[:start_date].present?
        @stones = Stone.joins(:bookings).where('bookings.start_date >= ?', "#{params[:start_date]}")
      end
    
      if params[:end_date].present?
        @stones = Stone.joins(:bookings).where('bookings.end_date <= ?', params[:end_date])
      end
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
    set_marker
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

  def set_markers
    @markers = @stones.geocoded.map do |stone|
      {
        lat: stone.latitude,
        lng: stone.longitude
      }
    end
  end

  def set_marker
    if @stone.latitude != nil && @stone.longitude != nil 
      @marker =
        {
          lat: @stone.latitude,
          lng: @stone.longitude
        }
    else 
      @marker = nil
    end
  end
end