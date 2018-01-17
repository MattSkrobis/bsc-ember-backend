class ReplyMailer < ApplicationMailer
  default :from => "matts@bsc.example.com"
  layout "mailer"

  def send_email(reply)
    @reply = reply
    mail(:to => "#{@reply.message.email}", :subject => "Odpowiedź na pytanie")
  end
end
