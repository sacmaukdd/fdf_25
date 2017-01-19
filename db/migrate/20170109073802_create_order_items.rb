class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.integer :price
      t.integer :total_price
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
    add_index :order_items, [:order_id, :product_id, :created_at]
  end
end
