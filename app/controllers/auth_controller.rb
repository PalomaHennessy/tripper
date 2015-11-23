class AuthController < ApplicationController

	def callback
		provider_user = request.env['omniauth.auth']

		#find or create the user
		user = User.find_or_create_by(provider_id: provider_user['uid'], 
			provider: params[:provider]) do |u|
			u.provider_hash = provider_user['credentials']['token']
			u.name = provider_user['info']['name']
			if provider_user = 'facebook' do
				u.email = provider_user['info']['email']
			end
		end
		gflash :success => "You are now logged in!"
		session[:user_id] = user.id
		redirect_to root_path
	end

	def failure
	end

	def logout
		session[:user_id] = nil
		gflash :error => "You are now logged out!"
		redirect_to root_path
	end

	private 

	  def user_params
	    params.require(:user).permit(:user_id, :email, :password)
	  end
end
