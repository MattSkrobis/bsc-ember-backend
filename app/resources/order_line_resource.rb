class OrderLineResource < JSONAPI::Resource
  attributes :count, :size
  
  belongs_to :product
  belongs_to :order
end
