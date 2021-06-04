class PullRequest < ApplicationRecord
  belongs_to :repository

  has_many :reviews, dependent: :destroy

  validates :number, presence: true, uniqueness: { scope: :repository_id }
end
