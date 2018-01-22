class ApplicationController < ActionController::API
  include JSONAPI::ActsAsResourceController
  include ActionController::MimeResponds
  include ActionController::RequestForgeryProtection

  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }
  acts_as_token_authentication_handler_for User, fallback: :none
  
  # def context
  #   { current_user: current_user }
  # end

  # def authenticate_user!
  #   _0, token, _2, email = request.headers['Authorization'].split('"') if request.headers['Authorization']
  #   user = User.find_by(email: email)
  #   if Devise.secure_compare(user.authentication_token, token)
  #     sign_in user
  #   end
  # end
end
