class Tag < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :taggings
  has_many :posts, :through => :taggings
end
