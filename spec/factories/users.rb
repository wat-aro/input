FactoryBot.define do
  factory :user do
    sequence(:name) {|n| "user_name#{n}"}
  end
end
