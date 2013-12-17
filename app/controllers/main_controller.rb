class MainController < ApplicationController

	def index
		@stations = Station.all
	end

	def create
		station = Station.find(params[:id])
		@bar = station.find_bar
		new_bar = Bar.create(name: @bar.name, address: @bar.address.to_sentence, rating: @bar.rating)
		redirect_to action: 'show'
	end

	def show
		@station = Station.find(params[:id])
		binding.pry
		@bar = Bar.last
	end

end