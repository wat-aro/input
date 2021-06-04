FactoryBot.define do
  factory :pull_request do
    repository { nil }
    sequence(:number)

    trait :with_repository do
      repository { create(:repository, :with_owner) }
    end
  end
end
