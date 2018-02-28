class UserMailer < ApplicationMailer
  default :from => "matts@bsc.example.com"
  layout "mailer"

  def send_welcome_message(user)
    @user = user
    mail(:to => "#{@user.email}", :subject => "Witamy w BSC!")
  end
end
