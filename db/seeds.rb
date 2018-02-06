admin = User.create(first_name: "Angela", last_name: "Ziegler", email: "s.krobismateusz@gmail.com", 
address_line1: 'ul. 3 Maja 21', address_line2: '43-300 Bielsko-Biała', gender: 'female', 
telephone_number: 342423421, is_admin: true,
password: 'Secret99', password_confirmation: 'Secret99')

user = User.create(first_name: "Reinhardt", last_name: "Wilhelm", email: "skrobismateus.z@gmail.com",
 address_line1: "ul. Roosevelta 34/3", address_line2: "63-213 Poznań", 
 gender: "male", telephone_number: "342423423", is_admin: false,
 password: 'Secret99', password_confirmation: 'Secret99')

categories = ['Ubiór elegancki', 'Na codzień', 'Ubiór sportowy']
materials = ['Naturalny', 'Syntetyczny']
colors = ['Zielony', 'Czerwony', 'Niebieski', 'Fioletowy', 'Biały']

categories.each do |name|
  Category.create(name: name)
end

5.times do 
  ['Sukienka', 'Podkoszulek', 'Dres sportowy'].each_with_index do |name, index|
    Product.create(name: name, gender: 'female', description: Faker::Lorem.paragraph, sku: rand(100000), price: rand(200),
    availability: true, currency: 'zł', quantity: 10000, category_id: Category.find_by(name: categories[index]), material: materials.sample,
    color: colors.sample)
  end

  ['Garnitur', 'Koszula', 'Dres sportowy'].each_with_index do |name, index|
    Product.create(name: name, gender: 'male', description: Faker::Lorem.paragraph, sku: rand(100000), price: rand(200),
    availability: true, currency: 'zł', quantity: 10000, category_id: Category.find_by(name: categories[index]), material: materials.sample,
    color: colors.sample)
  end
end

Product.where(name: 'Sukienka').update_all(category_id: 1)
Product.where(name: 'Garnitur').update_all(category_id: 1)
Product.where(name: 'Podkoszulek').update_all(category_id: 2)
Product.where(name: 'Koszula').update_all(category_id: 2)
Product.where(name: 'Dres sportowy').update_all(category_id: 3)

q1 = Question.create(description: 'Jaki kolor preferujesz?', query_field: 'color')
colors.each {|answer| Answer.create(question_id: q1.id, description: answer)}

q2 = Question.create(description: 'Jaki typ tkaniny preferujesz?', query_field: 'material')
materials.each {|answer| Answer.create(question_id: q2.id, description: answer)}

q3 = Question.create(description: 'Jakie ubrania lubisz najbardziej?', query_field: 'category')
categories.each {|answer| Answer.create(question_id: q3.id, description: answer)}

Question.all.each do |question|
  User.all.each do |user|
    UserAnswer.create(user_id: user.id, question_id: question.id, answer_id: question.answers.sample.id)
  end
end

order_statuses = ['Zrealizowane', 'W realizacji', 'Nieopłacone', 'Anulowane']
products = Product.pluck(:id)

order_statuses.each do |status|
  Order.create(user: user, status: status, discount: rand(50)).tap do |order|
    3.times do 
      OrderLine.create(count: rand(5), order: order, product_id: products.sample, size: ['XS', 'S', 'M', 'L', 'XL'].sample)
    end
  end
end

Reply.skip_callback(:create, :after, :send_mail)

message = Message.create(email: user.email, body: 'Treść pytania')
Reply.create(body: 'Treść odpowiedzi', message: message)

Reply.set_callback(:create, :after, :send_mail)
