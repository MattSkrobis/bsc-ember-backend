class ApplicationController < ActionController::API
  include JSONAPI::ActsAsResourceController
  include ActionController::RequestForgeryProtection

  protect_from_forgery with: :null_session
end
