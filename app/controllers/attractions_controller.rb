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
    ride.user.tickets -= ride.attraction.tickets
    ride.user.nausea += ride.attraction.nausea_rating
    ride.user.happiness += ride.attraction.happiness_rating
    ride.user.save
    redirect_to user_path(session[:user_id])
  end

end
