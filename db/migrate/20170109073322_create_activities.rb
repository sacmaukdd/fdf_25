class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.integer :action_id
      t.string :action_type
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :activities, [:user_id, :created_at]
  end
end
