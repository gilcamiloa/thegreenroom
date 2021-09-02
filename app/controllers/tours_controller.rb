class ToursController < ApplicationController
  before_action :set_tour, only: %i[new create show index]

  def index
    if params[:user_id]
      @tours = User.find(params[:user_id]).tours
    else
      @tours = Tours.all.order(start_time: :DESC)
    end
  end

  def new
    @tour = Tour.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @tour = Tour.new(tour_params)
    @booking = Booking.find(params[:booking_id])
    @tour.booking = @booking
    @tour.start_time = @booking.dates.first
    @booking.user = current_user
    if @tour.save
      redirect_to tours_path
    else
      render :new
    end
  end

  def show
    @venues = Tour.find(params[:id]).venues
    @markers = @venues.geocoded.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        info_window: render_to_string(partial: "venues/info_window", locals: { venue: venue })
      }
    end
  end

  private

  def tour_params
    params.require(:tour).permit(:name)
    # params.require(:tour).permit(:name, :start_time)
  end

  def set_tour
    @tour = Tour.find(params[:id])
  end
end
