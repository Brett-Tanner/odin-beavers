class AddFoodAndHomeToBeavers < ActiveRecord::Migration[7.0]
  def change
    add_column :beavers, :fav_food, :string
    add_column :beavers, :place_of_residence, :string
  end
end
