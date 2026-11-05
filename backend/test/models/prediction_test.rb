require "test_helper"

class PredictionTest < ActiveSupport::TestCase
  setup do
    @user = User.create!(name: "Nicholas")
    @match = Match.create!(home_team: "FC Basel", away_team: "FC Zürich", kickoff_at: 1.day.from_now)
  end

  test "is valid with user, match and scores" do
    prediction = Prediction.new(user: @user, match: @match, home_score: 2, away_score: 1)
    assert prediction.valid?
  end

  test "is invalid without scores" do
    assert_not Prediction.new(user: @user, match: @match).valid?
  end

  test "user can only predict a match once" do
    Prediction.create!(user: @user, match: @match, home_score: 1, away_score: 0)
    duplicate = Prediction.new(user: @user, match: @match, home_score: 2, away_score: 2)
    assert_not duplicate.valid?
  end
end