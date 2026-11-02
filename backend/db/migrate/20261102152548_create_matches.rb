class CreateMatches < ActiveRecord::Migration[8.1]
  def change
    create_table :matches do |t|
      t.string :home_team
      t.string :away_team
      t.datetime :kickoff_at
      t.integer :home_score
      t.integer :away_score

      t.timestamps
    end
  end
end
