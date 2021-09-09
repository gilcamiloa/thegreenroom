class ToursController < ApplicationController
  before_action :set_tour, only: %i[show index edit update]

  def index
    if params[:user_id]
      @tours = User.find(params[:user_id]).tours
    else
      @tours = Tour.all.order(start_date: :DESC)
    end
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user = current_user
    if @tour.save
      redirect_to venues_path
    else
      render :new
    end
  end

  def show
    @venues = Tour.find(params[:id]).venues
    @dates_booked = []
    @venues.each do |venue|
      venue.bookings.where(tour: params[:id]).each { |booking| @dates_booked << booking.dates }
    end
    @dates_booked.flatten!.uniq! unless @dates_booked.empty?
    @markers = @venues.geocoded.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        id: venue.id,
        info_window: render_to_string(partial: "venues/info_window", locals: { venue: venue })
      }
    end
  end

  def edit; end

  def update
    if @tour.update(tour_params)
      redirect_to tour_path(@tour), notice: "Tour was successfully updated."
    else
      render :edit
    end
  end

  private

  def tour_params
    params.require(:tour).permit(:name, :photo)
  end

  def set_tour
    if params[:id]
      @tour = Tour.find(params[:id])
    end
  end
end
