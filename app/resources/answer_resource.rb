class AnswerResource < JSONAPI::Resource
  attributes :description
  
  has_one :question
  has_many :user_answers
end