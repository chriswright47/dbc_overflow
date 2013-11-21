class Comment < ActiveRecord::Base
  attr_accessible :body, :commentable_id, :user_id

  belongs_to :commentable, polymorphic: true
  belongs_to :user
end
