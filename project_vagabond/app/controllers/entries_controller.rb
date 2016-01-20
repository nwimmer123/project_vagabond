class EntriesController < ApplicationController
	def index
		@entries = Entry.all.sort{|a,b| b.created_at <=> a.created_at}
	end

	def show
		@entry = Entry.find_by_id(params[:id])
		@user = User.find_by_id(@entry.user_id)
	end

	def new
	end

	def create
	end

	def edit
		@entry = Entry.find_by_id(params[:id])
	end

	def update
		entry_params = params.require(:entry).permit(:title, :body)
		@entry = Entry.find_by_id(params[:id])
		@entry.update_attributes(entry_params)

		redirect_to entry_path
	end
end
