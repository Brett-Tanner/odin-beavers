class AddUrlToBeavers < ActiveRecord::Migration[7.0]
  def change
    add_column :beavers, :url, :string
  end
end
