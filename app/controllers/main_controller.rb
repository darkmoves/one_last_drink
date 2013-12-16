class MainController < ApplicationController

	def index
		@stations = Station.all
	end

end