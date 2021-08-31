class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @venues = Venue.all
    @markers = @venues.geocoded.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude
      }
    end
  end

  def show
    @venue = Venue.find(params[:id])
  end
end
