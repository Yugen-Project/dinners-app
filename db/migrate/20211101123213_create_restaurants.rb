class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :description
      t.string :restaurant_img_url
      t.integer :tables
      t.text :location
      t.integer :contact
      t.integer :avail_tables

      t.timestamps
    end
  end
end
