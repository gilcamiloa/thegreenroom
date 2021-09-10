class BookingsController < ApplicationController
  def index
    if params[:tour_id]
      @bookings = Tour.find(params[:tour_id]).bookings
    elsif params[:venue_id]
      @bookings = Venue.find(params[:venue_id]).bookings
    elsif params[:user_id]
      @user = User.find(params[:user_id])
      @bookings = []
      if @user.is_band
        @user.bookings.each { |booking| @bookings << booking }
      else
        unless @user.venues.empty?
          @user.venues.each { |venue| venue.bookings.each { |booking| @bookings << booking } }
        end
      end
    else
      @bookings = Booking.all
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @bookings = Booking.new
  end

  def create
    @booking = Booking.new
    @booking_dates = params[:booking][:dates].split(',').map do |date|
      Date.parse(date).to_datetime
    end
    @booking_dates = @booking_dates.sort
    @booking_dates.each do |date|
      create_booking(date)
      save_booking(date)
      update_venue(date)
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.accepted = true
    @booking.save
    redirect_to request.referrer
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.accepted = false
    @booking.save
    redirect_to request.referrer
  end
  private

  def create_booking(date)
    @booking = Booking.new
    @booking.dates = [date]
    @booking.venue = Venue.find(params[:venue_id])
    unless params[:booking][:tour_id].empty?
      @tour = Tour.find(params[:booking][:tour_id])
      @booking.tour = @tour
    end
    @booking.user = current_user
    @booking.status = false
  end

  def update_venue(date)
      @booking.venue.available_dates.delete(date)
      redirect_to venue_path(@venue) unless @booking.venue.update({ available_dates: @booking.venue.available_dates })
  end

  def save_booking(date)
    if @booking.save
      if date == @booking_dates.last
        if defined?(@tour)
          redirect_to venues_path
        else
          redirect_to bookings_path(user_id: current_user)
        end
      end
    else
      redirect_to venue_path(@booking.venue)
    end
  end
end
