class ProductResource < JSONAPI::Resource
  attributes :name, :description, :sku, :availability, :currency, :price, :quantity
  has_one :category
  has_many :pictures
  has_many :order_lines
  
  filter :availability
  filter :name, apply: ->(records, value, _options) {
    value[0] ? records.search(value[0]) : records
  }
  filter :selected_ids, apply: ->(records, value, _options) {
    value[0] ? records.where(id: value[0]) : []
  }
end