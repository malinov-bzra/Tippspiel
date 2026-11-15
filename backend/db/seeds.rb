nicholas = User.create!(name: "Nicholas")
anna = User.create!(name: "Mika")

basel = Match.create!(home_team: "FC Barcelona", away_team: "FC Real Madrid", kickoff_at: 2.days.ago, home_score: 2, away_score: 1)
yb = Match.create!(home_team: "Everton", away_team: "AC Bournemouth", kickoff_at: 1.day.ago, home_score: 0, away_score: 0)
Match.create!(home_team: "Arsenal", away_team: "Chelsea", kickoff_at: 3.days.from_now)

Prediction.create!(user: nicholas, match: basel, home_score: 2, away_score: 1)
Prediction.create!(user: nicholas, match: yb, home_score: 1, away_score: 0)
Prediction.create!(user: anna, match: basel, home_score: 3, away_score: 1)
Prediction.create!(user: anna, match: yb, home_score: 0, away_score: 0)