class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.string :name
      t.string :description
      t.string :meal_img_url
      t.string :price

      t.timestamps
    end
  end
end
