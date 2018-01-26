class UserResource < JSONAPI::Resource
  attributes :first_name, :last_name, :email, :password, :password_confirmation,
    :current_password, :address_line1, :address_line2, :gender, :telephone_number, 
    :is_admin, :user_has_preferences
  end