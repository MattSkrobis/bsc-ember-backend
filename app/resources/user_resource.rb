class UserResource < JSONAPI::Resource
  attributes :first_name, :last_name, :email, :password, :password_confirmation,
    :current_password, :address_line1, :address_line2, :gender, :telephone_number
end