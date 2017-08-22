class ProductResource < JSONAPI::Resource
  attributes :name, :description, :sku, :availability, :currency, :price, :quantity

    filter :availability
    filter :name, apply: ->(records, value, _options) {
      value[0] ? records.search(value[0]) : records
    }
end