class Comment < ApplicationRecord
  belongs_to :review

  validates :path, :body, presence: true
end
