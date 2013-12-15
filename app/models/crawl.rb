class Crawl < ActiveRecord::Base
	has_and_belongs_to_many :stations
	has_many :bars, through: :stations

	def find_bar(station)
		client = Yelp::Client.new
		request = Yelp::V2::Search::Request::GeoPoint.new(
								term: 'bars',
								latitude: station.lat,
								longitude: station.long)
		response = client.search(request)
		bars = []
		response['businesses'].each do |bar|
			bars << Bar.new(name: bar['name'],
											address: bar['location']['display_address'],
											rating: bar['rating'],
											)
		end
		@bar = bars[Random.rand(1..bars.length)]

	end


end