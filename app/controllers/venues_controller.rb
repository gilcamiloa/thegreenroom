require 'json'
class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
    @dates = @venue.available_dates.to_json
    # @dates = ['2021-08-27T06:00:00', '2021-08-26T06:00:00', '2021-08-29T06:00:00', '2021-08-30T06:00:00', '2021-08-31T06:00:00']
  end
end
