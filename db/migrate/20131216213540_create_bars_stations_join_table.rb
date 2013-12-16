class CreateBarsStationsJoinTable < ActiveRecord::Migration
  def change
  	create_table :bars_stations do |t|
      t.belongs_to :bar
      t.belongs_to :station
    end
  end
end
