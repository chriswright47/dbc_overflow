require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    username "Chris"
    email "chris@mail.com"
    phase 3
    password "1234"
  end

  factory :question do
    title "Question Title"
    body "Question Body"
    user_id 1

    after(:build) do |question|
      question.taggings << FactoryGirl.build(:tagging)
    end
  end

  factory :answer do 
    body "Answer Body"
  end

  factory :tag do
    factory :ruby_tag do
      name "Ruby"
      description "Only the best programming language ever, no big deal"
    end

    factory :javascript_tag do
      name "Javascript"
      description "Nasty curly brackets all over the place, but you'll survive"
    end

  end

  factory :tagging do
    question_id 1
    tag_id 1
  end
end
