class Answer < ActiveRecord::Base
  attr_accessible :body, :question_id, :user_id

  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  belongs_to :question
  belongs_to :user
end



