class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.text :name
      t.text :address
      t.decimal :rating

      t.timestamps
    end
  end
end
