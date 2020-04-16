# frozen_string_literal: true

class Api::V1::StatisticsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  # POST /api/v1/statistics/note_achievement
  def note_achievement
    statistics = GameStatistic.new(statistics_params)

    if statistics.save
      render json: statistics, status: :created
    else
      render json: statistics.errors, status: :unprocessable_entity
    end
  end

  # GET /api/v1/statistics/last_achievements
  def last_achievements
    achievement_id = params[:achievement_id]
    player_id      = params[:player_id]
    games_count    = params[:games_count]

    last_achievements = StatisticsManager::LastAchievements
      .call(achievement_id, player_id, games_count)

    render json: last_achievements.any?, status: :ok
  end

  # GET /api/v1/statistics/top_players
  def top_players
    achievement_id = params[:achievement_id]
    team_id        = params[:team_id]
    players_count  = params[:players_count]

    players = StatisticsManager::TopPlayers
      .call(achievement_id, team_id, players_count)

    render json: players, status: :ok
  end


  private

  def statistics_params
    params.require(:statistic).permit(:game_id, :player_id, :team_id, :achievement_id)
  end

  def handle_record_not_found
    render status: :not_found
  end
end
