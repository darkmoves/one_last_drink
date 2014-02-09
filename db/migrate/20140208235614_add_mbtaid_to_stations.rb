class AddMbtaidToStations < ActiveRecord::Migration
  def change
    add_column :stations, :mbta_id, :string
  end
end
