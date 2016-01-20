class EntriesController < ApplicationController
	def index
		@entries = Entry.all.sort{|a,b| b.created_at <=> a.created_at}
	end

	def show
		@entry = Entry.find_by_id(params[:id])
		@user = User.find_by_id(@entry.user_id)
	end

	def new
		@entry = Entry.new
	end

	def create
		entry_params = params.require(:entry).permit(:title, :body, :city_id)
		@entry = Entry.new(entry_params.merge(user_id: session[:user_id]))
		@entry.save
		redirect_to entry_path(@entry.id)
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

	def destroy
		@entry = Entry.find_by_id(params[:id])
		@entry.destroy
		redirect_to entries_path
	end
end
