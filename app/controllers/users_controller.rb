class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save!
      flash[:success] = 'User successfully created!'
    else
      flash[:error] = 'User could not be created.'
    end

    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:age, :height, :name, :weight)
  end
end
