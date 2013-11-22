class Answer < ActiveRecord::Base
  attr_accessible :body, :question_id, :user_id

  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  belongs_to :question
  belongs_to :user

  validates :body, presence: true
  validates :question_id, presence: true
  validates_uniqueness_of :body, scope: :question_id

  def vote_count
    self.votes.count
  end
end



