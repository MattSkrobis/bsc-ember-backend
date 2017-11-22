FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "description_#{n}" }
    sequence(:gender) { ['male', 'female'].sample  }
    sequence(:description) { |n| "description_#{n}" }
    sku rand(100000) 
    price rand(500)
    sequence(:material) { ['Naturalny', 'Syntetyczny'].sample }
    sequence(:color) { ['Zielony', 'Czerwony', 'Niebieski', 'Fioletowy', 'Biały'].sample }
    currency 'zł'
    availability true
    quantity 10000

    ['Garnitur', 'Koszula', 'Dres sportowy'].each_with_index do |name, index|
      Product.create(name: name, gender: 'male', description: Faker::Lorem.paragraph, sku: rand(100000), price: rand(500),
      availability: true, currency: 'zł', quantity: 10000, category_id: Category.find_by(name: categories[index]), material: materials.sample,
      color: colors.sample)
    end
  end
end