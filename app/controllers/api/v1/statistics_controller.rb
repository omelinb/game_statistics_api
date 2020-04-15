class Api::V1::StatisticsController < ApplicationController

  # POST /api/v1/statistics/add_player_achievement
  def add_player_achievement
    statistics = GameStatistic.new(statistics_params)

    if statistics.save
      render json: statistics, status: :created
    else
      render json: statistics.errors, status: :unprocessable_entity
    end
  end

  # GET /api/v1/statistics/check_player_achievement
  def check_player_achievement
    player = Player.find(params[:player_id])
    last_games = player.team.games.order('id desc').limit(5)
    last_achievements = GameStatistic.where(
      game_id:        last_games.ids,
      player_id:      player.id,
      team_id:        player.team.id,
      achievement_id: params[:achievement_id]
    )

    render json: last_achievements.any?, status: :ok
  end

  # GET /api/v1/statistics/top_players
  def top_players
    statistics = GameStatistic.where(achievement_id: params[:achievement_id])
    statistics = statistics.where(team_id: params[:team_id]) if params[:team_id]
    top_players_ids = statistics.group(:player_id).order(:count).count.last(5)
    players = Player.where(id: top_players_ids)

    render json: players, status: :ok
  end


  private

  def statistics_params
    params.permit(:game_id, :player_id, :team_id, :achievement_id)
  end
end
