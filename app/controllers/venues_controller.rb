require 'json'
class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @venues = Venue.all
    @markers = @venues.geocoded.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        info_window: render_to_string(partial: "info_window", locals: { venue: venue })
      }
    end
  end

  def show
    @venue = Venue.find(params[:id])
    @booking = Booking.new
    @available_dates = @venue.available_dates.map { |date|
      Date.parse(date.to_s).strftime("%Y-%m-%d")
    }
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    if @venue.save!
      redirect_to venue_path(@venue)
    else
      render :new
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :description, :capacity, :available_dates, :longitude, :latitude, photos: [])
  end
end
