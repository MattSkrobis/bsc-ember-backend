class UserAnswerResource < JSONAPI::Resource
  attributes :user_id, :answer_id, :question_id
  belongs_to :user
  belongs_to :question
  belongs_to :answer

  filter :question_id
  filter :user_id

 def self.records(options = {})
    context[:current_user].user_answers
  end
end