class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :sku
      t.integer :cost
      t.integer :inventory
      t.integer :store_id

      t.timestamps
    end
  end
end
