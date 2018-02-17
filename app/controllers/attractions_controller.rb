class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    @user = session[:user_id]
  end

  def ride
    @user = User.find_by(:id => params[:id])
    @attraction = Attraction.find_by(:id => params[:id])
    @ride = Ride.create(:user_id => params[:user_id], :attraction_id => params[:attraction_id])
    @message = @ride.take_ride
    redirect_to user_path(@ride.user, :message => @message)
  end

end
