Team.destroy_all

2.times do
  Team.create!(name: Faker::Team.name)
end
