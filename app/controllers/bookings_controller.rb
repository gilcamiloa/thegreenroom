class BookingsController < ApplicationController
  def index
    if params[:tour_id]
      @bookings = Tour.find(params[:tour_id]).bookings
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
    create_booking
    update_venue
    save_booking
  end

  private

  def create_booking
    @booking = Booking.new
    @booking.dates = params[:booking][:dates].split(',').map do |date|
      Date.parse(date).to_datetime
    end
    @booking.dates = @booking.dates.sort
    @booking.venue = Venue.find(params[:venue_id])
    unless params[:booking][:tour_id].empty?
      @tour = Tour.find(params[:booking][:tour_id])
      @booking.tour = @tour
    end
    @booking.user = current_user
    @booking.status = false
  end

  def update_venue
    @booking.dates.each do |date|
      @booking.venue.available_dates.delete(date)
    end
    redirect_to venue_path(@venue) unless @booking.venue.update({ available_dates: @booking.venue.available_dates })
  end

  def save_booking
    if @booking.save!
     if defined?(@tour) 
      redirect_to tour_path(@tour)
     else
       # placeholder path untill we have a bookings page
       redirect_to venue_path(@booking.venue)
     end
    else
      redirect_to venue_path(@booking.venue)
    end
  end
end
