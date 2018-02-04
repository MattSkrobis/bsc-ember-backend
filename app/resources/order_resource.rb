class OrderResource < JSONAPI::Resource
  attributes :status, :created_at, :discount, :transaction_number, :total, :courier, :price_after_discount, :payment_method
  
  has_many :order_lines
  has_one :user

  filter :cart, apply: ->(records, value, _options) {
    records.cart(value[0]['userId'])
  }
  filter :not_cart, apply: ->(records, value, _options) {
    records.not_cart(value[0]['userId'])
  }

end
