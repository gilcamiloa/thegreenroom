require 'json'
class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
    @dates = @venue.available_dates.map { |date| 
      Date.parse(date.to_s).strftime("%Y-%m-%d")
    }
  end
end
