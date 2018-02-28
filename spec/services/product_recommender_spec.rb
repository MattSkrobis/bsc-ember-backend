require 'rails_helper'

describe ProductRecommender do
  let!(:user) { create(:user, gender: 'female') }
  let!(:user_answer) { create(:user_answer, answer: answer , question: question, user: user) }
  let!(:preferred_product) { create(:product, category: category, color: 'red', gender: 'female') }
  let!(:other_product) { create(:product, category: category, color: 'green', gender: 'female') }
  let!(:category) { create(:category) }
  let!(:question) { create(:question, query_field: 'color') }
  let!(:answer) { create(:answer, description: 'red', question: question) }

  it {expect(ProductRecommender.new(user).call).to match([preferred_product]) }
end