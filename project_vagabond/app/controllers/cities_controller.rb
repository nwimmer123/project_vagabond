class CitiesController < ApplicationController
	def index
		# sorts the cities in alphabetical order
		@cities = City.all.sort{|a,b| a.name <=> b.name}
	end

	def show
		@city = City.find_by_id(params[:id])
		@entries = @city.entries.sort{|a,b| b.created_at <=> a.created_at}
	end
end
