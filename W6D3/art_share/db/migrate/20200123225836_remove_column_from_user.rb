class RemoveColumnFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :like_id
    remove_column :users, :like_type
  end
end
