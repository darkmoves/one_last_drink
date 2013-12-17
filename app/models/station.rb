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

		bars = []
		response['businesses'].each do |bar|
			bars << Bar.new(name: bar['name'],
											address: bar['location']['display_address'],
											rating: bar['rating'],
											)
		end
		# Randomizes results, so even the cached results still become random. 
		@bar = bars[Random.rand(0..(bars.length-1))]
	end

end
