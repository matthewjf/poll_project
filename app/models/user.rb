# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  user_name  :string
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true

  has_many :polls,
    foreign_key: :author_id,
    primary_key: :id,
    class_name: :Poll

  has_many :questions,
    through: :polls,
    source: :questions


end
