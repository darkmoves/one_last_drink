class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.text :name
      t.decimal :lat
      t.decimal :long
      t.datetime :last_train_nb
      t.datetime :last_train_sb
      t.text :line

      t.timestamps
    end
  end
end
