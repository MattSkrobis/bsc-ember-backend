class ProductRecommender 

def initialize(user)
  @user = user
end

def call
  recommend_products
end

private 

def recommend_products
 products = Product.search_by_gender(user.gender)
 if query_fields.include?('color')
  products = products.search_by_color(question_answer('color'))
 elsif query_fields.include?('material')
  products = products.search_by_material(question_answer('material'))
 elsif query_fields.include?('category')
  products = products.search_by_category(question_answer('category'))
 end
 products
end

def user_answers
  user.user_answers
end

def query_fields
  user_answers.map(&:question).pluck(:query_field)
end

def question_answer(query_field)
  user_answers.find{|user_answer| user_answer.question.query_field == query_field}.answer.description
end

attr_accessor :user
end