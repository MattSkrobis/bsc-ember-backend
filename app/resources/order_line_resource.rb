class OrderLineResource < JSONAPI::Resource
  attributes :count
  
  belongs_to :product
  belongs_to :order
end
