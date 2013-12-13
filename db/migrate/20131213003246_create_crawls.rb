class CreateCrawls < ActiveRecord::Migration
  def change
    create_table :crawls do |t|
      t.text :name
      t.decimal :distance

      t.timestamps
    end
  end
end
