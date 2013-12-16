class BarsController < ApplicationController

	def create
		station = Station.find(params[:id])
		@bar = station.find_bar
		new_bar = Bar.create(name: @bar.name, address: @bar.address.to_sentence, rating: @bar.rating)
		redirect_to action: 'show'
	end

	def show
		@bar = Bar.last
	end

end
