class MessageResource < JSONAPI::Resource
  attributes :body, :email, :is_unanswered
  has_many :replies

  filter :email, apply: ->(records, value, _options) {
    value[0] ? records.search(value[0]) : records
  }
end
