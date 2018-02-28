class UserAnswerResource < JSONAPI::Resource
  attributes :answer_description, :question_description
  has_one :user
  has_one :question
  has_one :answer

  filter :question_id
  filter :user_id

  def self.updatable_fields(context)
    [:user, :question, :answer]
  end

  def self.creatable_fields(context)
    [:user, :question, :answer]
  end
end