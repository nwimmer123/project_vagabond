class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		user_params = params.require(:user).permit(:email, :password)
		@user = User.confirm(user_params)
		if @user
			flash[:success] = "Welcome back..."
			login(@user)
			redirect_to my_profile_path
		else
			flash[:error] = "Incorrect email or password."
			redirect_to '/login'
		end
	end
	
	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end

end