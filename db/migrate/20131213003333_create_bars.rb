class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.text :name
      t.text :address
      t.integer :price_range
      t.decimal :rating
      t.decimal :lat
      t.decimal :long

      t.timestamps
    end
  end
end
