class CitiesController < ApplicationController
	def index
		# sorts the cities in alphabetical order
		@cities = City.order(name: :asc)
	end

	def show
		@city = City.find_by_id(params[:id])
		@entries = @city.entries.order(created_at: :desc)
	end

end