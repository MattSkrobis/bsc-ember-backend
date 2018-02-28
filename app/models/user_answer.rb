class UserAnswer < ApplicationRecord
  belongs_to :answer
  belongs_to :user
  belongs_to :question

  def answer_description
    answer.description if answer
  end

  def question_description
    question.description if question
  end
end
