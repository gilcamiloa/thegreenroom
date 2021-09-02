class ToursController < ApplicationController
  before_action :set_tour, only: %i[show index]

  def index
    if params[:user_id]
      @tours = User.find(params[:user_id]).tours
    else
      @tours = Tour.all.order(start_date: :DESC)
    end
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user = current_user
    if @tour.save
      redirect_to tour_path(@tour)
    else
      render :new
    end
  end

  def show; end

  private

  def tour_params
    params.require(:tour).permit(:name, :start_date, :end_date)
  end

  def set_tour
    if params[:id]
      @tour = Tour.find(params[:id])
    end
  end
end
