class CreateGameStatistics < ActiveRecord::Migration[6.0]
  def change
    create_table :game_statistics do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :team_id
      t.integer :achievement_id
    end
  end
end
