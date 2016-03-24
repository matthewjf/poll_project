class AddNullConstraintToPollsAuthorId < ActiveRecord::Migration
  def change
    change_column :polls, :author_id, :integer, null: false
  end
end
