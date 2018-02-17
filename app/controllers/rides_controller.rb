class RidesController < ApplicationController

  def new
    @user = User.find_by(:id => params[:id])
    @attraction = Attraction.find_by(:id => params[:id])
  end


  def index
  end

  def show

  end

end
