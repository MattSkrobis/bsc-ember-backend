class UserResource < JSONAPI::Resource
  attributes :first_name, :last_name, :email
end