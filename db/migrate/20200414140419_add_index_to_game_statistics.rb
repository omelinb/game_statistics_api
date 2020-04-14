class AddIndexToGameStatistics < ActiveRecord::Migration[6.0]
  def change
    add_index :game_statistics, [
      :game_id, :team_id, :player_id, :achievement_id
    ], unique: true, name: 'by_player_game_team_achievement' 
  end
end
