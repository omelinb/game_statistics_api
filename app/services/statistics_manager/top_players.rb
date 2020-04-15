module StatisticsManager
  class TopPlayers < ApplicationService
    def initialize(achievement_id, team_id, players_count)
      @achievement_id = achievement_id
      @team_id        = team_id
      @players_count  = players_count || 5
    end

    def call
      statistics = GameStatistic.where(achievement_id: @achievement_id)
      statistics = statistics.where(team_id: @team_id) if @team_id
      players_ids = statistics
        .group(:player_id).order(:count).count.keys.last(@players_count)
      Player.where(id: players_ids)
    end
  end
end
