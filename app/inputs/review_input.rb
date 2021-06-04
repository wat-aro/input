class ReviewInput
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :commit_id, :string
  attribute :body, :string
  attribute :event, :string, default: 'COMMENT'
  attribute :comments, InputType.new(Review::CommentInput, array: true), default: []

  validates :body, presence: true, if: ->(input) { input.event.in?(%w[REQUEST_CHANGES COMMENT])}
  validates :event, presence: true, inclusion: { in: %w[APPROVE REQUEST_CHANGES COMMENT] }
  validates :comments, input: true, allow_blank: true
end
