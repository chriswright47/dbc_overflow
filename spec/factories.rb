require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    username "Chris"
    email "Chris@mail.com"
    phase 3
    password "1234"
  end

  factory :question do
    title "Question Title"
    body "Question Body"
    user_id 1
  end
end
