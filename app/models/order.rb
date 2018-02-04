class Order < ApplicationRecord
  COURIER_PRICES = {'DSD': 12, 'QRS': 11, 'Poczta Polska': 9}
  belongs_to :user
  has_many :order_lines
  
  scope :cart, ->(user_id){ where(user_id: user_id, status: 'Koszyk') }
  scope :not_cart, ->(user_id){ where(user_id: user_id).where.not(status: 'Koszyk') }
  
  # after_update :calculate_total
  # after_update :calculate_discount,
    # if: Proc.new { |order| order.status ==  'Nieopłacone' }
  after_update :send_mail,
  if: Proc.new { |order| order.status !=  'Koszyk' }

  after_update :create_draft_order,
  if: Proc.new { |order| order.status ==  'Niezrealizowane' }

  def send_mail
    if self.status == 'Zrealizowane'
      OrderMailer.fulfilled_email(self).deliver_now
    elsif self.status == 'Anulowane'
      OrderMailer.cancelled_email(self).deliver_now
    elsif self.status == 'W realizacji'
      OrderMailer.paid_email(self).deliver_now
    else 
      OrderMailer.creation_email(self).deliver_now
    end
  end

  def shipment_number
    rand(1000000000000)
  end

  def create_draft_order
    self.user.create_draft_order
  end

  # def calculate_total
  #   if self.total
  #     products_total = self.order_lines
  #     .map { |ol| [ol.product.price, ol.count]}
  #     .inject do |acc, arr|
  #       acc = arr.first*arr.last
  #       acc
  #     end
  #     self.save
  #   end
  # end

  # def calculate_discount
  #   if !self.price_after_discount && self.price_changed?
  #     if self.total < 500
  #       self.price_after_discount = self.total * 0.98
  #     elsif self.total < 1000
  #       self.price_after_discount = self.total * 0.95
  #     else 
  #       self.price_after_discount = self.total * 0.90
  #     end
  #     self.save
  #   end
  # end
end