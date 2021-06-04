class Review < ApplicationRecord
  belongs_to :pull_request

  has_many :comments, dependent: :destroy

  validates :commit_id, presence: true
  validates :event, presence: true

  enum event: {
    approve: 'APPROVE',
    request_changes: 'REQUEST_CHANGES',
    comment: 'COMMENT',
    pending: 'PENDING'
  }
end
