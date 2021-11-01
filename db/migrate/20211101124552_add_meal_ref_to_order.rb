class AddMealRefToOrder < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :meal, null: false, foreign_key: true
  end
end
