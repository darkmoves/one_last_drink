class MainController < ApplicationController

	def index
		@crawl = Crawl.new
		@stations = Station.all
	end

end