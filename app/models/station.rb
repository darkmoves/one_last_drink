class Station < ActiveRecord::Base

	def find_bar
		# The following line will benefit from Redis. 
		# This will expire in a week, and will query is the place is different too. 
		response = Rails.cache.fetch([:yelp_search, lat, long], expires_in: 1.week) do
			client = Yelp::Client.new
			request = Yelp::V2::Search::Request::GeoPoint.new(
								term: 'bars',
								latitude: lat,
								longitude: long,
								sort: 1,
								limit: 10)
			client.search(request)
		end
		@bar = response['businesses'][Random.rand(0..(response['businesses'].length - 1))]
	end

	def last_train(direction)
		if direction == 'nb'
			self.last_train_nb
		elsif direction == 'sb'
			self.last_train_sb
		else 
		end
	end

  def next_train(direction)
    times = []
    predictions = []

    if self.line != "green"
      response = HTTParty.get("http://developer.mbta.com/lib/rthr/#{self.line}.json")
      trips = response["TripList"]["Trips"]

      if direction == 'nb' && line == 'red'
        trips.each {|trip| if trip["Destination"] == 'Alewife' then predictions << trip["Predictions"] end}
      elsif direction == 'sb' && line == 'red'
        trips.each {|trip| if (trip["Destination"] == 'Ashmont' || trip["Destination"] == 'Braintree') then predictions << trip["Predictions"] end}
      elsif direction == 'nb' && line == 'orange'
        trips.each {|trip| if trip["Destination"] == 'Oak Grove' then predictions << trip["Predictions"] end}
      elsif direction == 'sb' && line == 'orange'
        trips.each {|trip| if trip["Destination"] == 'Forest Hills' then predictions << trip["Predictions"] end}
      elsif direction == 'nb' && line == 'blue'
        trips.each {|trip| if trip["Destination"] == 'Wonderland' then predictions << trip["Predictions"] end}
      elsif direction == 'sb' && line == 'blue'
        trips.each {|trip| if trip["Destination"] == 'Bowdoin' then predictions << trip["Predictions"] end}
      end
      predictions.flatten!
      predictions.each {|prediction| if prediction["Stop"] == self.mbta_id then times << prediction["Seconds"] end}

      times.sort.first
    end
  end

end
