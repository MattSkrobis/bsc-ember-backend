class Order < ApplicationRecord
  belongs_to :user
  has_many :order_lines
  
  after_create :send_created_email
  before_create :calculate_discount
  after_update :send_mail
  
  def send_created_email
    OrderMailer.creation_mail(self).deliver_now
  end

  def send_mail
    if self.status == 'Zrealizowane'
      OrderMailer.fulfilled_email(self).deliver_now
    elsif self.status == 'Anulowane'
      OrderMailer.cancelled_email(self).deliver_now
    elsif self.status == 'W realizacji'
      OrderMailer.paid_email(self).deliver_now
    end
  end

  def courier
    ['DSD', 'QRS', 'Poczta Polska'].sample
  end

  def shipment_number
    rand(1000000000000)
  end
end
