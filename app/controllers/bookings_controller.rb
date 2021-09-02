class BookingsController < ApplicationController
  def index
    if params[:tour_id]
      @bookings = Tour.find(params[:toud_id]).bookings
    elsif params[:venue_id]
      @bookings = Venue.find(params[:venue_id]).bookings
    else
      @bookings = Booking.all
    end
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
    @booking.venue = @venue
    @bookings.tour = Tour.find(params[:tour_id]) if params[:tour_id]
    @booking.user = current_user
    @booking.status = false
    if @booking.save!
      # placeholder path untill we have a bookings page
      redirect_to venues_path
    else
      redirect_to venue_path(@venue)
    end
  end
end
