FactoryGirl.define do
  factory :answer do
    sequence(:description) { |n| "description_#{n}" }
  end
end