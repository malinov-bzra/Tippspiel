class Prediction < ApplicationRecord
  belongs_to :user
  belongs_to :match

  validates :home_score, :away_score,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :user_id, uniqueness: { scope: :match_id }
end