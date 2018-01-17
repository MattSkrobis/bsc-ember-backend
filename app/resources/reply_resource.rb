class ReplyResource < JSONAPI::Resource
  attributes :body, :email
  
  belongs_to :message
end