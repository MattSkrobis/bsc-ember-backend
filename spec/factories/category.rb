    FactoryGirl.define do
      factory :category do
        sequence(:description) { |n| "description_#{n}" }
      end
    end