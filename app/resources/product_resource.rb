class ProductResource < JSONAPI::Resource
  attributes :name, :description, :sku, :availability, :currency, :price, :quantity

  filter :availability
  filter :name
end