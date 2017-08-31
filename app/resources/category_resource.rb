class CategoryResource < JSONAPI::Resource
  attributes :name, :visible
  has_many :products
end
