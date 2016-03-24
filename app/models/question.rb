# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :string           not null
#  poll_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base

  def results
    num = self.answer_choices.joins("LEFT OUTER JOIN responses
        ON responses.answer_choice_id = answer_choices.id")
        .select("answer_choices.text, COUNT(responses.id) AS count")
        .group("answer_choices.id")

    results_hash = {}
    num.each do |relation|
      results_hash[relation.text] = relation.count
    end
    results_hash
  end





  validates :text, :poll_id, presence: true

  has_many :answer_choices,
    foreign_key: :question_id,
    primary_key: :id,
    class_name: :AnswerChoice

  belongs_to :poll,
    foreign_key: :poll_id,
    primary_key: :id,
    class_name: :Poll

  has_many :responses,
    through: :answer_choices,
    source: :responses
  end
