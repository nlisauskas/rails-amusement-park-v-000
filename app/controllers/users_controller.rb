class UsersController < ApplicationController
  before_action :signed_in?, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to signup_path
    end
  end

  def show
    @user = current_user
  end

  def login
    @user = User.new
  end


  private
  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin, :password_confirmation)
  end

  def signed_in?
    if !session[:user_id]
      redirect_to root_path
    end
  end


end
