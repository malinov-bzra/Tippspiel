class Match < ApplicationRecord
  validates :home_team, :away_team, :kickoff_at, presence: true
  validates :home_score, :away_score,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 },
            allow_nil: true

  def finished?
    home_score.present? && away_score.present?
  end
end