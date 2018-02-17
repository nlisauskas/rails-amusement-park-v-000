class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    @user = session[:user_id]
  end

  def ride
    ride = Ride.create(attraction_id: params[:attraction_id], user_id: session[:user_id])
    ride.take_ride
    redirect_to user_path(session[:user_id])
  end

end
