class AddStopidToStations < ActiveRecord::Migration
  def change
    add_column :stations, :stop_id, :string
  end
end
