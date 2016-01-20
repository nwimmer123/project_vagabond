class EntriesController < ApplicationController
	def index
		@user = User.find_by_id(params[:user_id])
		@entries = @user.entries
	end

	def show
		@entry = Entry.find_by_id(params[:id])
		@user = User.find_by_id(params[:user_id])
	end

	def new
		current_city_id = params[:id]
		# @current_city = name.current_city.id
	end
end
