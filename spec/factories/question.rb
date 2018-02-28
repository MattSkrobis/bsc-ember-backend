FactoryGirl.define do
  factory :question do
    sequence(:description) { |n| "description_#{n}" }
  end
end