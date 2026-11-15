require "test_helper"

class Api::MatchesControllerTest < ActionDispatch::IntegrationTest
  test "index returns matches as json" do
    Match.create!(home_team: "FC Barcelona", away_team: "FC Real Madrid", kickoff_at: 1.day.from_now)

    get api_matches_url

    assert_response :success
    assert response.parsed_body.any? { |match| match["home_team"] == "FC Barcelona" }
  end
end