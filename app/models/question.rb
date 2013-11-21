class Question < ActiveRecord::Base
  attr_accessible :body, :title, :user_id

  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  has_many :taggings
  has_many :tags, :through => :taggings

  has_many :answers

  belongs_to :user

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :body, presence: true
  validates :body, uniqueness: true


end
