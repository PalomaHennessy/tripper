class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.authenticate user_params[:email], user_params[:password]

  	if @user
      session[:user_id] = @user.user_id
      flash[:success] = "User logged in!"
      redirect to trip_index
    else
    	flash[:danger] = "Invalid credentials."
    	redirect to trip_index
  	end
  end

  def destroy
  end

  private 

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
