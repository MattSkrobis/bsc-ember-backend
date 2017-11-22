class UserAnswerResource < JSONAPI::Resource
  attributes :user_id, :answer_id, :question_id, :kot
  belongs_to :user
  belongs_to :question
  belongs_to :answer

  filters :user_id, :question_id

  def kot
    binding.pry
    context[:current_user]
  end
end