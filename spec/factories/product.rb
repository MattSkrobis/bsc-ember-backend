FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "description_#{n}" }
    sequence(:gender) { ['male', 'female'].sample  }
    sequence(:description) { |n| "description_#{n}" }
    sequence(:price) { rand(500) }
    sequence(:sku) { rand(100000) }
    sequence(:material) { ['Naturalny', 'Syntetyczny'].sample }
    sequence(:color) { ['Zielony', 'Czerwony', 'Niebieski', 'Fioletowy', 'Biały'].sample }
    currency 'zł'
    availability true
    quantity 10000
  end
end