# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
16.times do
  user = User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: '1234', phase: 3)
end
User.create(username: "chris", email: "chris@dbc.com", password: "1234", phase: 3)
User.create(username: "chirag", email: "chirag@dbc.com", password: "1234", phase: 3)
User.create(username: "connor", email: "connor@dbc.com", password: "1234", phase: 3)
User.create(username: "missy", email: "missy@dbc.com", password: "1234", phase: 3)

tag_names = %w[Ruby Javascript Rails Jquery CSS HTML Sinatra Objective-C Python]

tag_names.length.times do |i|
  Tag.create(name: tag_names[i], description: "questions related to #{tag_names[i]}")
end

# create 40 random questions with one random tag each
40.times do |i|
  tag = Tag.all.sample
  question = tag.questions.create(
                                  title: Faker::Company.bs,
                                  body: Faker::Lorem.paragraphs(3).join("\n"),
                                  user_id: rand(1..20)
                                  )
end

# create 150 upvotes and 50 downvotes randomly
200.times do |i|
  question = Question.all.sample
  if i % 4 == 0
    question.votes.create(user_id: rand(1..20), value: -1)
  else
    question.votes.create(user_id: rand(1..20), value: 1)
  end
end


