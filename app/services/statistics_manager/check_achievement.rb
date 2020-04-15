module StatisticsManager
  class CheckAchievement < ApplicationService
    def initialize(achievement_id, player_id, games_count)
      @achievement_id = achievement_id
      @player_id      = player_id
      @games_count    = games_count || 5
    end

    def call
      player = Player.find(@player_id)
      last_games = player.team.games.order('id DESC').limit(@games_count)
      GameStatistic.where(
        game_id:        last_games.ids,
        player_id:      player.id,
        team_id:        player.team.id,
        achievement_id: @achievement_id
      )
    end
  end
end