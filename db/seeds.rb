Game.destroy_all
Achievement.destroy_all
Player.destroy_all
Team.destroy_all


Achievement.create!(description: 'Ran 10+ kilometers')
Achievement.create!(description: 'Made 70% accurate throws')

3.times do
  Game.create!
end

2.times do
  Team.create!(name: Faker::Team.name)
end

Team.all.each do |team|
  5.times do
    team.players.create(name: Faker::Name.name)
  end
end

Game.all.each do |game|
  Player.all.each do |player|
    GameStatistic.create!(
      game_id: game.id,
      player_id: player.id,
      team_id: player.team.id,
      achievement_id: [*Achievement.ids, nil].sample
    )
  end
end
