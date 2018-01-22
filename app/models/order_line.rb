class OrderLine < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def total
    count * product.price
  end
end
