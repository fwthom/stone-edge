class StonesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    search
    set_markers(@stones)
  end

  def search
    @stones = Stone.all
      @stones = @stones.where(category_id: params[:category_id]) if params[:category_id].present?
      @stones = @stones.search_by_name_backstory_personnality(params[:query]) if params[:query].present?
      if params[:start_date].present? || params[:end_date].present?
      @stones = @stones.left_outer_joins(:bookings)
      # Exclure les pierres réservées pendant la période demandée
        if params[:start_date].present? && params[:end_date].present?
          @stones = @stones.where(
            'bookings.start_date >= ? OR bookings.end_date <= ? OR bookings.id IS NULL',
            params[:end_date], params[:start_date]
          )
        elsif params[:start_date].present?
          @stones = @stones.where(
            'bookings.start_date >= ? OR bookings.id IS NULL',
            params[:start_date]
          )
        elsif params[:end_date].present?
          @stones = @stones.where(
            'bookings.end_date <= ? OR bookings.id IS NULL',
            params[:end_date]
          )
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
    end
    set_marker(@stone)
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

  def set_markers(stones)
    @markers = stones.geocoded.map do |stone|
      {
        lat: stone.latitude,
        lng: stone.longitude
      }
    end
  end

  def set_marker(stone)
    if stone.latitude != nil && stone.longitude != nil
      @marker =[
        {
          lat: stone.latitude,
          lng: stone.longitude
        }
      ]
    else
      @marker = nil
    end
  end
end