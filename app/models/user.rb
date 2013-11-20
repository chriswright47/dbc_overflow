class User < ActiveRecord::Base
  attr_accessible :email, :password, :phase, :username

  has_many :comments
  has_many :posts
  has_many :votes
end
