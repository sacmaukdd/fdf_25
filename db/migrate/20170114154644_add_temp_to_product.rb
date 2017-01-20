class AddTempToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :temp, :integer, default: 0
  end
end
