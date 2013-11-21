require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :phase

  has_many :comments
  has_many :questions
  has_many :answers
  has_many :votes

  validates :email, :uniqueness => true
  validates :password, :presence => true

  has_secure_password, :validations => false
end
