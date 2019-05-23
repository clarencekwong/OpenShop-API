class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :quantity, :default => 1

      t.timestamps
    end
  end
end
