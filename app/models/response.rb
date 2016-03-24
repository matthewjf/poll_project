# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime
#  updated_at       :datetime
#

class Response < ActiveRecord::Base

  def sibling_responses
    question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    sibling_responses.any? do |sibling|
      sibling.respondent == self.respondent
    end
  end

  def respondent_is_author?
    question.poll.author == respondent
  end

  def validate_respondent_is_not_author
    if respondent_is_author?
      errors[:user] << "can't respond to their own poll"
    end
  end

  def validate_not_already_answered
    if respondent_already_answered?
      errors[:user] << "can only have one response"
    end
  end

  validates :user_id, :answer_choice_id, presence: true
  validates :answer_choice_id, uniqueness: { scope: :user_id }
  validate :validate_not_already_answered
  validate :validate_respondent_is_not_author

  belongs_to :answer_choice,
    foreign_key: :answer_choice_id,
    primary_key: :id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User

    has_one :question,
    through: :answer_choice,
    source: :question

  end
