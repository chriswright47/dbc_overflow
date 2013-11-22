# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
user = User.create(username: 'Chris', email: 'chris@dbc.com', password: '1234', phase: 3)

25.times do |i|
  question = Question.create(title: Faker::Company.bs , body: Faker::Company.catch_phrase, user_id: 1)
end