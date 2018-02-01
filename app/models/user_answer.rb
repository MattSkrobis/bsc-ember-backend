class UserAnswer < ApplicationRecord
  belongs_to :answer
  belongs_to :user
  belongs_to :question

  def answer_description
    answer.description
  end

  def question_description
    question.description
  end
end
