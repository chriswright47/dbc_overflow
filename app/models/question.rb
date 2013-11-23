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

  def vote_count
    value_array = self.votes.map {|vote| vote.value }
    # value_array = [1,1,1,-1]
    value_array.inject(0, :+)
  end

end
