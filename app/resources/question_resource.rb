class QuestionResource < JSONAPI::Resource
  attributes :description
  has_many :user_answers
  has_many :answers
end