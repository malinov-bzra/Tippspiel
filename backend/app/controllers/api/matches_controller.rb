module Api
  class MatchesController < ApplicationController
    def index
      render json: Match.order(:kickoff_at)
    end
  end
end