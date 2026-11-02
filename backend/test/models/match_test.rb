require "test_helper"

class MatchTest < ActiveSupport::TestCase
  test "is valid with all required attributes" do
    match = Match.new(home_team: "FC Basel", away_team: "FC Zürich", kickoff_at: 1.day.from_now)
    assert match.valid?
  end

  test "is invalid without a home team" do
    match = Match.new(away_team: "FC Zürich", kickoff_at: 1.day.from_now)
    assert_not match.valid?
  end

  test "is invalid with negative score" do
    match = Match.new(home_team: "FC Basel", away_team: "FC Zürich", kickoff_at: 1.day.from_now, home_score: -1)
    assert_not match.valid?
  end

  test "finished? is true only when both scores are set" do
    match = Match.new(home_score: 2, away_score: 1)
    assert match.finished?
    assert_not Match.new(home_score: 2).finished?
  end
end