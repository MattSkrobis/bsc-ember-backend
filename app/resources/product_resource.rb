class ProductResource < JSONAPI::Resource
  attributes :name, :description, :sku, :availability, :currency, :price, :quantity
end
