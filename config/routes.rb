# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'players/:player_id/teams/:team_id/games/:game_id/achievements/:achievement_id',
        to: 'game_achievements#assign'
      get  'players/:player_id/achievements/:achievement_id',
        to: 'statistics#last_achievements'
      get  'achievements/:achievement_id/teams/(:team_id)',
        to: 'statistics#top_players'
    end
  end 
end
