module Api
  class LeaderboardController < ApplicationController
    def index
      entries = User.includes(predictions: :match).map do |user|
        { name: user.name, points: total_points(user) }
      end

      render json: entries.sort_by { |entry| -entry[:points] }
    end

    private

    def total_points(user)
      user.predictions.sum { |prediction| ScoreCalculator.new(prediction, prediction.match).points }
    end
  end
end