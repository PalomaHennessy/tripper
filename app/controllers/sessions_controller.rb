class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.authenticate user_params[:email], user_params[:password]

  	if @user
      session[:user_id] = @user.id
      gflash :success => "User logged in!"
      redirect_to root_path
    else
    	gflash :danger => "Invalid credentials."
    	redirect_to root_path
  	end
  end

  def destroy
    session[:user_id] = nil
    gflash :error => "You are now logged out"
    redirect_to root_path
  end

  private 

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
