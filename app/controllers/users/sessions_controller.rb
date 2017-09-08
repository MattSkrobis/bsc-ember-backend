class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with_authentication_token(resource)
  end

  def destroy
    renew_authentication_token!
    sign_out
    render json: { head: :no_content }
  end

  protected
  
  def respond_with_authentication_token(resource)
    render json: {
      success: true,
      token: resource.authentication_token,
      email: resource.email,
      id: resource.id
    }
  end
end
