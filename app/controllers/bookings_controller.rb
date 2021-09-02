class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @bookings = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.dates = params[:booking][:dates].split(', ').map do |date|
      Date.parse(date).to_datetime
    end
    @venue = Venue.find(params[:venue_id])
    @booking.user = current_user
    @booking.venue = @venue
    @booking.status = false
    if @booking.save!
      # placeholder path untill we have a bookings page
      redirect_to venues_path
    else
      redirect_to venue_path(@venue)
    end
  end
end
