class CrawlsController < ApplicationController
	def index
		client = Yelp::Client.new
		request = Yelp::V2::Search::Request::GeoPoint.new(
								term: 'bars',
								latitude: 42.362413,
								longitude: -71.086382)
		response = client.search(request)
		bars = []
		response['businesses'].each do |bar|
			bars << Bar.new(name: bar['name'],
											address: bar['location']['display_address'],
											rating: bar['rating'],
											)
		end
		@bars = bars
	end
end