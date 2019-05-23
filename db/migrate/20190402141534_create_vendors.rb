class CreateVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :vendors do |t|
      t.string :company
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
