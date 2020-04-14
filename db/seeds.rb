Player.destroy_all
Team.destroy_all

2.times { Team.create!(name: Faker::Team.name) }

Team.all.each do |team|
  5.times { team.players.create(name: Faker::Name.name) }
end
