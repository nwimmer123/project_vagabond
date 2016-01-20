class EntriesController < ApplicationController
	def index
		@entries = Entry.all.sort{|a,b| b.created_at <=> a.created_at}
	end

	def show
		@entry = Entry.find_by_id(params[:id])
		@user = User.find_by_id(@entry.user_id)
	end

	def new
		current_city_id = params[:id]
		# @current_city = name.current_city.id
	end
end
