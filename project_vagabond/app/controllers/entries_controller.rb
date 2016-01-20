class EntriesController < ApplicationController
	def index
		
	end

	def show
		@entry = Entry.find_by_id(params[:id])
		@user = User.find_by_id(@entry.user_id)
	end
end
