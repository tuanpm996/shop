class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.integer :cart_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
    add_index :cart_items, :cart_id
    add_index :cart_items, :product_id
    add_index :cart_items, [:cart_id, :product_id], unique: true
  end
end
