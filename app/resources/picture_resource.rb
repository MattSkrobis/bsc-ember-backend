class PictureResource < JSONAPI::Resource
  attribute :url
  belongs_to :product
end
