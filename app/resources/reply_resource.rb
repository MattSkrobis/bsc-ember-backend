class ReplyResource < JSONAPI::Resource
  attributes :body, :email
  
  has_one :message
end