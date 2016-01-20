class UsersController < ApplicationController


	def index
	end

	def new
		
	end

	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to "/users/#{session[:user_id]}"
		else
			redirect_to '/signup'
		end
	end

	def edit
		user_id = params[:user_id]
		@user = User.find_by_id(user_id)
	end

	def update
		user_id = params[:user_id]
		user = User.find_by_id(user_id)
		current_params = params.require(:user).permit(:first_name, :last_name, :current_city)
		user.update_attributes(current_params)
		redirect_to(user_entries_path)
	end


private

	def user_params
		params.require(:user).permit(:first_name, :email, :last_name, :password, :password_confirmation, :current_city)
	end
	
end