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


# create teams

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

# create users

puts 'Creating user...'

5.times do
  User.create!(
    email: Faker::Internet.free_email,
    username: Faker::Internet.username,
    password: Faker::Internet.password,
    team: (team_one, team_two).sample
  )
end

# create ideas

puts 'Creating 10 ideas...'

10.times do
  Idea.create!(
    category: Faker::Hacker.adjective,
    content: Faker::Hacker.say_something_smart,
    channel: Faker::Hacker.noun,
    user: User.sample
  )
end
