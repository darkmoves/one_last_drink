class Station < ActiveRecord::Base
	has_and_belongs_to_many :crawls

	def find_bar
		client = Yelp::Client.new
		request = Yelp::V2::Search::Request::GeoPoint.new(
								term: 'bars',
								latitude: self.lat,
								longitude: self.long,
								sort: 1,
								limit: 10)
		response = client.search(request)
		bars = []
		response['businesses'].each do |bar|
			bars << Bar.new(name: bar['name'],
											address: bar['location']['display_address'],
											rating: bar['rating'],
											)
		end
		@bar = bars[Random.rand(0..(bars.length-1))]
	end

end
