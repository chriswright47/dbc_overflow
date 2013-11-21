require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :email, :phase, :username, :password

  has_many :comments
  has_many :questions
  has_many :answers
  has_many :votes

  has_secure_password
end
