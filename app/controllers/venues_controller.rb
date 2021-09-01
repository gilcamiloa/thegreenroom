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
    @dates = @venue.available_dates.map { |date| 
      Date.parse(date.to_s).strftime("%Y-%m-%d")
    }
  end
end
