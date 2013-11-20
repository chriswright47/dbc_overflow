class User < ActiveRecord::Base
  attr_accessible :email, :password, :phase, :username
end
