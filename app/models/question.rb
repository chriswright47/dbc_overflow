class Question < ActiveRecord::Base
  attr_accessible :body, :title, :user_id, :tags_attributes

  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  has_many :taggings
  has_many :tags, :through => :taggings

  accepts_nested_attributes_for :taggings, :allow_destroy => true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  has_many :answers

  belongs_to :user

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :body, presence: true
  validates :body, uniqueness: true
end
