class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.text :name
      t.decimal :lat
      t.decimal :long
      t.time :last_train_nb
      t.time :last_train_sb
      t.text :line

      t.timestamps
    end
  end
end
