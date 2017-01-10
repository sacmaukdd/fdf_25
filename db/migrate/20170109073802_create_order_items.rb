class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.integer :quatity
      t.integer :price
      t.references :oder, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
    add_index :order_items, [:oder_id, :product_id, :created_at]
  end
end
