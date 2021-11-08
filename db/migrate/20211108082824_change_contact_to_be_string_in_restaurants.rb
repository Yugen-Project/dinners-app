class ChangeContactToBeStringInRestaurants < ActiveRecord::Migration[6.1]
  def up
    change_column :restaurants, :contact, :string
  end

  def down
    change_column :restaurants, :contact, :integer
  end
end
