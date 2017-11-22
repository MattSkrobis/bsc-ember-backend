class QuestionResource < JSONAPI::Resource
  attributes :description
  has_many :user_answers
  has_many :answers

  # filter :user_selected_answers, apply: ->(records, value, _options) {
  #   binding.pry
  #   filter[name_last]
  #   value[0] ? records.where(user_id: value[0]) : []
  # }
end