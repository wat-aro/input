class Repository < ApplicationRecord
  belongs_to :owner, polymorphic: true

  has_many :pull_requests, dependent: :destroy

  validates :name, presence: true
end
