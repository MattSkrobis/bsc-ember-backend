class Order < ApplicationRecord
  COURIER_PRICES = {'DSD': 12, 'QRS': 11, 'Poczta Polska': 9}
  belongs_to :user
  has_many :order_lines
  
  scope :cart, ->(user_id){ where(user_id: user_id, status: 'Koszyk') }
  
  after_update :calculate_total
  after_update :calculate_discount,
    if: Proc.new { |order| order.status ==  'Nieopłacone' }
  after_update :send_mail,
  if: Proc.new { |order| order.status !=  'Koszyk' }

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

  def calculate_total
    if self.total
      products_total = self.order_lines.pluck(:price, :count).inject do |acc, arr|
        acc = arr.first*arr.last
        acc
      end
      self.total = COURIER_PRICES[self.courier] + products_total
      self.save
    end
  end

  def calculate_discount
    if !self.price_after_discount && self.price_changed?
      if self.total < 500
        self.price_after_discount = self.price * 0.98
      elsif self.total < 1000
        self.price_after_discount = self.price * 0.95
      else 
        self.price_after_discount = self.price * 0.90
      end
      self.save
    end
  end
end