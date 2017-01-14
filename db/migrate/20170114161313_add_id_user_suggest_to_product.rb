class AddIdUserSuggestToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :id_user_suggest, :integer
  end
end
