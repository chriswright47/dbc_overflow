class Post < ActiveRecord::Base
  attr_accessible :body, :question_id, :title, :user_id

  has_many :votes
  has_many :comments
  has_many :taggings
  has_many :tags, :through => :taggings

  has_many :answers, class_name: "Post", foreign_key: "question_id"
  belongs_to :question, class_name: "Post"

  belongs_to :user

end
