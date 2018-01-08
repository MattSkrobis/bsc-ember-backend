class QuestionsController < JSONAPI::ResourceController
  before_action :authenticate_user!

  def authenticate_user!
    bs, token, nothing, email = request.headers['Authorization'].split('"') if request.headers['Authorization']
    user = User.find_by(email: email)
    if Devise.secure_compare(user.authentication_token, token)
      sign_in user
    end
  end
end