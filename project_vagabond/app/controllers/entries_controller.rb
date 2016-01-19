class EntriesController < ApplicationController
	def index
		@user = User.find_by_id(params[:user_id])
		@entries = @user.entries
	end

	def show
		@entry = Entry.find_by_id(params[:id])
	end
end
