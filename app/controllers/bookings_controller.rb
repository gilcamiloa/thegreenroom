class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @bookings = Booking.new
  end
end
