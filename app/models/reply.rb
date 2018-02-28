class Reply < ApplicationRecord
  belongs_to :message

  after_create :send_mail

  def send_mail
    ReplyMailer.send_email(self).deliver_now
  end
end
