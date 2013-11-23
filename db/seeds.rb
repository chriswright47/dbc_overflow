# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
6.times do
	user = User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: '1234', phase: 3)
end

User.create(username: "chris", email: "chris@dbc.com", password: "1234", phase: 3)
User.create(username: "chirag", email: "chirag@dbc.com", password: "1234", phase: 3)
User.create(username: "connor", email: "connor@dbc.com", password: "1234", phase: 3)
User.create(username: "missy", email: "missy@dbc.com", password: "1234", phase: 3)



25.times do |i|
  question = Question.create(title: Faker::Company.bs , body: Faker::Company.catch_phrase, user_id: rand(1..10))
end

10.times do |i|
	Tag.create(name: "Ruby#{i}", description: "Awesomesauce#{i}")
end