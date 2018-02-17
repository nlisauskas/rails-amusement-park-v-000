class RidesController < ApplicationController

  def new
    @user = User.find_by(:id => params[:id])
    @attraction = Attraction.find_by(:id => params[:id])
    @ride = Ride.create(:user_id => params[:user_id], :attraction_id => params[:attraction_id])
  end


  def index
  end

  def show

  end

end
