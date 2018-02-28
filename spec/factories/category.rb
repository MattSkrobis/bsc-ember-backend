    FactoryGirl.define do
      factory :category do
        sequence(:name) { |n| "description_#{n}" }
      end
    end