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

		t_train = @station.last_train_sb
		t_now = Time.now

		time = Calculation.time_comparison(t_train, t_now)
		@hour = time[0]
		@min = time[1]
	end

end