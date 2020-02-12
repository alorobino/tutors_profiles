class UsersController < ApplicationController

  def index
    @users = User.search(params[:search], params)
  end
  def show
    @user = User.find(params[:id])
  end

  def create
  end

  def edit
  end

private
  def post_params
    params.require(:user).permit(:username, :location, :rate, :experience, :gender, :avatar, :search)
  end

end
