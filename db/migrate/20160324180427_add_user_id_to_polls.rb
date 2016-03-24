class AddUserIdToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :author_id, :integer
  end
end
