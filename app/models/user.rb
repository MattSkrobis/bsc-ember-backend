class User < ApplicationRecord
  has_many :user_answers
  acts_as_token_authenticatable
  after_create :create_user_answers
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  private

  def user_has_preferences?
    user.user_answers.pluck(:answer_id).any?
  end

  def create_user_answers
    Question.each do |question|
      UserAnswer.create(question: question, user: self)
    end
  end
end
