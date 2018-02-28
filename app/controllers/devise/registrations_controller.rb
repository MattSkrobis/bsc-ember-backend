# frozen_string_literal: true

class Devise::RegistrationsController < DeviseController
  prepend_before_action :require_no_authentication, only: [:new, :create, :cancel]

  # POST /resource
  def create
    self.resource = resource_class.new_with_session(sign_up_params, session)

    resource.save!
    sign_in(resource_name, resource)
    render json: {user_id: resource.id, status: 304}
  end

  protected

  def sign_up_params
    params.require(:user).permit(
    :first_name, :last_name, :address_line1,
     :address_line2, :gender, :telephone_number,
     :email, :password, :password_confirmation
     )
  end
end