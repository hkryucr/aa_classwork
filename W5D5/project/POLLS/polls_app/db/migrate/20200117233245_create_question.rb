class CreateQuestion < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :body
      t.integer :poll_id
    end
  end
end
