class AddEndpointsToStations < ActiveRecord::Migration
  def change
    add_column :stations, :nb_endpoint, :boolean
    add_column :stations, :sb_endpoint, :boolean
  end
end
