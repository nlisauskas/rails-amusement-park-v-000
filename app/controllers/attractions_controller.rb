class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    @user = session[:user_id]
  end

  def ride
    ride = Ride.create(attraction_id: params[:attraction_id], user_id: session[:user_id])
    @user = ride.user
    @attraction = ride.attraction
    flash[:notice] = ride.take_ride
    redirect_to user_path(session[:user_id])
  end

  def edit
  end

  private
  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
