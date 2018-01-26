class ProductResource < JSONAPI::Resource
  attributes :name, :description, :sku, :availability, :currency, :price, :quantity, :color, :gender, :material
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
  filter :preferred_products, apply: ->(records, value, _options) {
    if value[0] && User.find(value[0]).user_has_preferences
      ProductRecommender.new(User.find(value[0])).call
    else 
      []
    end
  }

  private

  def user_has_preferences?
    context[:current_user].user_has_preferences?
  end
end