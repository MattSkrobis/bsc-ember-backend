class OrderMailer < ApplicationMailer
  default :from => "matts@bsc.example.com"
  layout "mailer"

  def cancelled_email(order)
    @order = order
    mail(:to => "#{@order.user.email}", :subject => "Zamówienie zostało anulowanew")
  end

  def fulfilled_email(order)
    @order = order
    mail(:to => "#{@order.user.email}", :subject => "Zamówienie zostało wysłane")
  end

  def created_email(order)
    @order = order
    mail(:to => "#{@order.user.email}", :subject => "Zamówienie zostało przyjęte")
  end

  def paid_email(order)
    @order = order
    mail(:to => "#{@order.user.email}", :subject => "Zamówienie zostało opłacone")
  end
end
