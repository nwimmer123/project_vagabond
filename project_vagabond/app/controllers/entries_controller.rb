class EntriesController < ApplicationController
	def index
		@user = User.find_by_id(params[:user_id])
		@entries = @user.entries
	end


end
