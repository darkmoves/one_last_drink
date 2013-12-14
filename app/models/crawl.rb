class Crawl < ActiveRecord::Base
	has_and_belongs_to_many :stations
	has_many :bars, through: :stations
end