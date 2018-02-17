class UsersController < ApplicationController
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
    if logged_in?
    @user = User.find_by(params[:id])
  else
      redirect_to root_path
    end
  end

  def login
    @user = User.new
  end


  private
  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :password_confirmation)
  end

  def logged_in?
    current_user.id == session[:user_id]
  end


end
