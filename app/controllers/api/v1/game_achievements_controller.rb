# frozen_string_literal: true

class Api::V1::GameAchievementsController < ApplicationController

  # POST /api/v1/players/:player_id/teams/:team_id/games/:game_id/achievements/:achievement_id
  def assign
    statistics = GameStatistic.new(statistics_params)

    if statistics.save
      render json: statistics, statpus: :created
    else
      render json: statistics.errors, status: :unprocessable_entity
    end
  end

  private

  def statistics_params
    params.permit(:game_id, :player_id, :team_id, :achievement_id)
  end
end
