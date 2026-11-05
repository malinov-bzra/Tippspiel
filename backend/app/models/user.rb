class User < ApplicationRecord
  has_many :predictions, dependent: :destroy
  validates :name, presence: true
end