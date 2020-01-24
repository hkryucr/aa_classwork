class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :like_id, :integer
    add_column :users, :like_type, :string

    add_index :users, [:like_id, :like_type], unique: true
  end
end
