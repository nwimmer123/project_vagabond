class EntriesController < ApplicationController
	before_action :logged_in?, only: [:edit, :destroy, :new]
	before_action :current_user?, only: [:edit]
	
	def index
		@entries = Entry.all.sort{|a,b| b.created_at <=> a.created_at}
	end

	def show
		@entry = Entry.find_by_id(params[:id])
		@user = User.find_by_id(@entry.user_id)
	end

	def new
		@entry = Entry.new
		@city = City.find_by_id(params[:id])
	end

	def create
		entry_params = params.require(:entry).permit(:title, :body, :city_id)
		@entry = Entry.new(entry_params.merge(user_id: session[:user_id]))
		if @entry.save
			redirect_to entry_path(@entry.id)
		else
			redirect_to "/cities/#{params[:entry][:city_id]}/new"
			flash[:error] = "Wrong number of characters"
		end
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

	private

	def current_user?
		entry = Entry.find_by_id(params[:id]).user_id
		if entry != session[:user_id]
			flash[:notice] = "NO."
			redirect_to entry_path
		end

		
	end



end
