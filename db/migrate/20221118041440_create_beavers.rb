class CreateBeavers < ActiveRecord::Migration[7.0]
  def change
    create_table :beavers do |t|
      t.string :name
      t.integer :age
      t.integer :cuteness
      t.integer :hunger

      t.timestamps
    end
  end
end
