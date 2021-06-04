class User < ApplicationRecord
  has_many :repositories, as: :owner

  validates :name, presence: true
end
