class User < ApplicationRecord
  has_many :user_answers
  has_many :orders
  acts_as_token_authenticatable
  after_create :create_user_answers
  after_create :create_draft_order
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def user_has_preferences
    user_answers.pluck(:answer_id).any?
  end

  def cart_order
    orders.where(status: 'Koszyk')
  end
  private

  def create_user_answers
    Question.all.each do |question|
      UserAnswer.create(question: question, user: self)
    end
  end

  def create_draft_order
    Order.create(status: 'Koszyk', user: self)
  end
end
