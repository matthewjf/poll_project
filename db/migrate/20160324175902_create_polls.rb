class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :title, null: false
    end
    add_foreign_key :polls, :user, name: :author_id
  end
end
