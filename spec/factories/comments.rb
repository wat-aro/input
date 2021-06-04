FactoryBot.define do
  factory :comment do
    review { nil }
    path { '/app/controllers/application_controller.rb' }
    position { 1 }
    body { 'cut line' }
    line { nil }
    side { nil }
    start_line { nil }
    start_side { nil }

    trait :with_review do
      review { create(:review, :with_pull_request) }
    end
  end
end
