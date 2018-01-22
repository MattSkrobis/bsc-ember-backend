# frozen_string_literal: true

class Devise::PasswordsController < DeviseController
  prepend_before_action :require_no_authentication

  # POST /resource/password
  def create
    resource = resource_class.find_by(email: params[:email])
     if (resource)
      resource.send_reset_password_instructions
     end
    render json: { head: :no_content }
  end

  # PUT /resource/password
  def update

    attributes = resource_params
    original_token = attributes[:reset_password_token]
    
    recoverable = resource_class.find_or_initialize_by(reset_password_token: original_token)
  
    if recoverable.persisted?
      if recoverable.reset_password_period_valid?
        reset_password_token = Devise.token_generator.generate(resource_class, :reset_password_token, original_token)
        recoverable.reset_password(attributes[:password], attributes[:password_confirmation])
      end
    end
  
    render json: { head: :no_content }
  end
end