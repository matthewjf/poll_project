class ChangeTables < ActiveRecord::Migration
  def change
    add_column(:polls, :created_at, :datetime)
    add_column(:polls, :updated_at, :datetime)
    add_column(:questions, :created_at, :datetime)
    add_column(:questions, :updated_at, :datetime)
  end
end
