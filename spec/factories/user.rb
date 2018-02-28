FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "first_name_#{n}" }
    sequence(:last_name) { |n| "last_name_#{n}" }
    sequence(:address_line1) { |n| "address_line1_#{n}" }
    sequence(:address_line2) { |n| "address_line2_#{n}" }
    sequence(:gender) { ['male', 'female'].sample  }
    sequence(:email) { |n| "email#{n}@me.com" }
    sequence(:telephone_number) { |n| n }
    sequence(:password) { 'secret' }
    sequence(:password_confirmation) { 'secret' }
  end

  factory :admin, parent: :user do
    is_admin true
  end
end