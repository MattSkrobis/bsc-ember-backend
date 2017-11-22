class ApplicationController < ActionController::API
  include JSONAPI::ActsAsResourceController
  include ActionController::MimeResponds
  include ActionController::RequestForgeryProtection

  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }
  acts_as_token_authentication_handler_for User, fallback: :none
  
  def context
    { current_user: current_user }
  end
end
