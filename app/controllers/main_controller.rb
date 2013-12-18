class MainController < ApplicationController

	def index
		@red_line_stations = Station.where(line: 'red')
		@orange_line_stations = Station.where(line: 'orange')
		@green_line_stations = Station.where(line: 'green')
		@blue_line_stations = Station.where(line: 'blue')
	end

	def show
		# Define variables via params hash
		@station = Station.find(params[:id])
		direction = params[:direction]

		# Select a bar hash from the Yelp API using the find_bar class method.
		@bar = @station.find_bar

		# Extract bar attributes from the bar hash to display in the view.
		@name = @bar['name']
		@address = @bar['location']['display_address'].split.join(", ")
		@rating = @bar['rating']

		# Select the last train time using the last_train method and direction variable, taken from the params hash.
		# Declare the current time in UTC to match the time zone of the scheduled last trains. 		
		t_train = @station.last_train(direction)
		t_now = Time.now.utc

		# Get the time remaining until the last train using the time_comparison class method. Returns a 2 element hash with hours, minutes.
		time = Calculation.time_comparison(t_train, t_now)

		# Create the variable to display time using the elements from the time hash. Below method adds a 0 before single digit minutes for reasonable display.
		if time[1] < 10
			@time = "#{time[0]}:0#{time[1]}"
		else
			@time = "#{time[0]}:#{time[1]}"
		end

	end

end