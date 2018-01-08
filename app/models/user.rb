class User < ApplicationRecord
  has_many :user_answers
  acts_as_token_authenticatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  private
  def user_has_preferences?
    user.user_answers.pluck(:answer_id).any?
  end
end
