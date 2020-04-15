Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'statistics/note_achievement',  to: 'statistics#note_achievement'
      get  'statistics/last_achievements', to: 'statistics#last_achievements'
      get  'statistics/top_players',       to: 'statistics#top_players'
    end
  end 
end
