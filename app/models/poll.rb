# == Schema Information
#
# Table name: polls
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  author_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Poll < ActiveRecord::Base
  validates :title, uniqueness: true
  validates :author_id, :title, presence: true

  has_many :questions,
    foreign_key: :poll_id,
    primary_key: :id,
    class_name: :Question

  belongs_to :author,
    foreign_key: :author_id,
    primary_key: :id,
    class_name: :User
end
