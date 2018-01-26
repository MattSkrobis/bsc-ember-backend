class OrderLineResource < JSONAPI::Resource
  attributes :count, :size
  
  has_one :product
  has_one :order
end
