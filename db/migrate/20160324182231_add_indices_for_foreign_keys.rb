class AddIndicesForForeignKeys < ActiveRecord::Migration
  def change

    add_index :questions, :poll_id
    add_index :answer_choices, :question_id
  end
end
