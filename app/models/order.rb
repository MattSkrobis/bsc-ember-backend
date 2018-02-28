class Order < ApplicationRecord
  COURIER_PRICES = {'DSD': 12, 'QRS': 11, 'Poczta Polska': 9}
  belongs_to :user
  has_many :order_lines
  
  scope :cart, ->(user_id){ where(user_id: user_id, status: 'Koszyk') }
  scope :not_cart, ->(user_id){ where(user_id: user_id).where.not(status: 'Koszyk') }
  
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
end