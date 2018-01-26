class UserAnswerResource < JSONAPI::Resource
  attributes :user_id, :answer_id, :question_id
  has_one :user
  has_one :question
  has_one :answer

  filter :question_id
  filter :user_id

  def self.records(options = {})
    options[:context][:current_user].user_answers
  end
end