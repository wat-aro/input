class Review::CommentInput
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :path, :string
  attribute :position, :integer
  attribute :body, :string
  attribute :line, :integer
  attribute :side, :string
  attribute :start_line, :integer
  attribute :start_side, :string

  validates :path, :body, presence: true
end
