class UserController < ApplicationController

  def index
  end

  def create
    puts "Trying to create a user!!!!!!!!!!!!!!!!!!!!!!!!!!"
    User.create user_params
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end

end
