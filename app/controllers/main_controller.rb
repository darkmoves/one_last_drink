class MainController < ApplicationController

	def index
		@stations = Station.all
	end

	def show
		@station = Station.find(params[:id])
		@bar = @station.find_bar
	end

end