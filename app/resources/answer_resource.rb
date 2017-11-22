class AnswerResource < JSONAPI::Resource
  attributes :description
  
  belongs_to :question
  has_many :user_answers
end