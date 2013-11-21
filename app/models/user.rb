class User < ActiveRecord::Base
  attr_accessible :email, :password, :phase, :username

  has_many :comments
  has_many :questions
  has_many :answers
  has_many :votes
end
