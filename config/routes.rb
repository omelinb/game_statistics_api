Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'statistics/add_player_achievement', to: 'statistics#add_player_achievement'
      get 'statistics/check_player_achievement', to: 'statistics#check_player_achievement'
      get 'statistics/top_players', to: 'statistics#top_players'
    end
  end 
end
