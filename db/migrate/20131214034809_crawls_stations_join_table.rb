class CrawlsStationsJoinTable < ActiveRecord::Migration
  def change
  	create_table :crawls_stations, id: false do |t|
  		t.integer :crawl_id
  		t.integer :station_id
  	end
  end
end
