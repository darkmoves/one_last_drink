class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.text :name
      t.decimal :lat
      t.decimal :long

      t.timestamps
    end
  end
end
