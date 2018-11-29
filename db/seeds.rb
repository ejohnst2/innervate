# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'destroying all now...'
Idea.destroy_all
User.destroy_all
Team.destroy_all


puts 'Creating team...'
team_one = Team.create!(
  plan: "free",
  name: "team_one",
  slack_id: "150000"
)

puts 'Creating team...'
team_two = Team.create!(
  plan: "free",
  name: "team_two",
  slack_id: "140000"
)


puts 'Creating user...'

user = User.create!(
  email: "rayblack@gmail",
  password: "rayray",
  team: team_one
)

puts 'Creating 5 ideas...'

idea =  Idea.create!(
    category: "yo this work",
    content: "best idea ever",
    channel: "newchannel",
    user: user
  )


idea_two = Idea.create!(
    category: "yo this ishwork",
    content: "best idea ever",
    channel: "newchannel",
    user: user
  )

