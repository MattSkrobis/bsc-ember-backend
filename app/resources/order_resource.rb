class OrderResource < JSONAPI::Resource
  attributes :status, :created_at
  
  has_many :order_lines
  has_one :user

  belongs_to :order
end
