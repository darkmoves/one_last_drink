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
		@bar = response['businesses'][Random.rand(0..(response['businesses'].length))]
	end

end
