FactoryBot.define do
  factory :review do
    pull_request { nil }
    sequence(:commit_id) {|n| OpenSSL::Digest.hexdigest('SHA256', "commit_id_#{n}") }
    body { nil }
    event { 'APPROVE' }

    trait :with_pull_request do
      pull_request { create(:pull_request, :with_repository) }
    end
  end
end
