# frozen_string_literal: true

class Api::V1::StatisticsController < ApplicationController

  # GET /api/v1/players/:player_id/achievements/:achievement_id
  def last_achievements
    achievement_id = params[:achievement_id]
    player_id      = params[:player_id]
    games_count    = params[:games_count]

    last_achievements = StatisticsManager::LastAchievements
      .call(achievement_id, player_id, games_count)

    render json: last_achievements.any?, status: :ok
  end

  # GET /api/v1/achievements/:achievement_id/teams/(:team_id)
  def top_players
    achievement_id = params[:achievement_id]
    team_id        = params[:team_id]
    players_count  = params[:players_count]

    players = StatisticsManager::TopPlayers
      .call(achievement_id, team_id, players_count)

    render json: players, status: :ok
  end
end
