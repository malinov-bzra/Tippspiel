require "test_helper"

class ScoreCalculatorTest < ActiveSupport::TestCase
  def points_for(predicted, actual)
    prediction = Prediction.new(home_score: predicted[0], away_score: predicted[1])
    match = Match.new(home_score: actual[0], away_score: actual[1])
    ScoreCalculator.new(prediction, match).points
  end

  test "exact result gives 3 points" do
    assert_equal 3, points_for([2, 1], [2, 1])
  end

  test "correct goal difference gives 2 points" do
    assert_equal 2, points_for([3, 1], [2, 0])
  end

  test "correct outcome gives 1 point" do
    assert_equal 1, points_for([2, 0], [3, 0])
  end

  test "wrong outcome gives 0 points" do
    assert_equal 0, points_for([2, 1], [0, 1])
  end

  test "draw with different score gives 2 points" do
    assert_equal 2, points_for([1, 1], [2, 2])
  end

  test "unfinished match gives 0 points" do
    assert_equal 0, points_for([2, 1], [nil, nil])
  end
  
end