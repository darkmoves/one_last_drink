class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.text :name
      t.text :address
      t.integer :rating
      t.belongs_to :station

      t.timestamps
    end
  end
end
