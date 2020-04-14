Player.destroy_all
Team.destroy_all

2.times do
  Team.create!(name: Faker::Team.name)
end

Team.all.each do |team|
  5.times do
    team.players.create(name: Faker::Name.name)
  end
end
