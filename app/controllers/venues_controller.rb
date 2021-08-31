class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end
end
