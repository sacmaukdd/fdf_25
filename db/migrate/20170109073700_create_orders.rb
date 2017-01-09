class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :orders, [:user_id, :created_at]
  end
end
