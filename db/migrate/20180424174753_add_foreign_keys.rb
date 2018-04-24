class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :user_id, :integer
    add_column :responses, :question_id, :integer
    add_column :responses, :user_id, :integer
  end
end
