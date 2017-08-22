class CategoryResource < JSONAPI::Resource
  attributes :name, :visible
  relationship :product, to: :many
end
