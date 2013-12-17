class MainController < ApplicationController

	def index
		@stations = Station.all
	end

	def show
		@station = Station.find(params[:id])
		@bar = @station.find_bar
		@name = @bar['name']
		@address = @bar['location']['display_address'].to_sentence
		@rating = @bar['rating']
	end

end