class UsersController < ApplicationController

	before_action :logged_in?, only: [:edit]
	before_action :active_user?, only: [:edit]

	def index
		@cities = City.all
	end

	def new
		
	end

	def create
		user = User.new(user_params)
		if user.save
			login(user)
			redirect_to my_profile_path
		else
			flash[:error] = "Email has already been taken"
			redirect_to '/signup'
		end
	end

	def profile
		@user = User.find_by_id(session[:user_id])
		render :show
	end

	def show
		@user = User.find_by_id(params[:id])
	end

	def edit
		user_id = params[:id]
		@user = User.find_by_id(user_id)
	end

	def update
		user_id = params[:id]
		user = User.find_by_id(user_id)
		current_params = params.require(:user).permit(:first_name, :last_name, :current_city)
		user.update_attributes(current_params)
		redirect_to(my_profile_path)
	end


private

	def user_params
		params.require(:user).permit(:first_name, :email, :last_name, :password, :password_confirmation, :current_city)
	end


	def active_user?
		if params[:id] != session[:user_id].to_s
			flash[:notice] = "You do not have access to edit profiles that are not your own."
			redirect_to root_path
		end
	end







	
end