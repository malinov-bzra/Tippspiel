class ScoreCalculator
  EXACT_POINTS = 3
  DIFFERENCE_POINTS = 2
  OUTCOME_POINTS = 1

  def initialize(prediction, match)
    @prediction = prediction
    @match = match
  end

  def points
    return 0 unless @match.finished?

    if exact_result?
      EXACT_POINTS
    elsif same_difference?
      DIFFERENCE_POINTS
    elsif same_outcome?
      OUTCOME_POINTS
    else
      0
    end
  end

  private

  def exact_result?
    @prediction.home_score == @match.home_score &&
      @prediction.away_score == @match.away_score
  end

  def same_difference?
    predicted_difference == actual_difference
  end

  def same_outcome?
    (predicted_difference <=> 0) == (actual_difference <=> 0)
  end

  def predicted_difference
    @prediction.home_score - @prediction.away_score
  end

  def actual_difference
    @match.home_score - @match.away_score
  end
end