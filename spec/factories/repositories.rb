FactoryBot.define do
  factory :repository do
    sequence(:name) {|n| "repository_name#{n}" }
    owner { nil }

    trait :with_owner do
      owner { create(:user) }
    end
  end
end
