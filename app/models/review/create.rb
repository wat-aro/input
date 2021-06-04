class Review::Create
  private attr_reader :pull_request

  def initialize(pull_request)
    @pull_request = pull_request
  end

  def call(input)
    raise InputInvalid, input if input.invalid?

    ApplicationRecord.transaction do
      review = pull_request.reviews.create!(input.attributes.except('comments'))

      input.comments.each do |comment_input|
        review.comments.create!(comment_input.attributes)
      end
    end
  end
end
