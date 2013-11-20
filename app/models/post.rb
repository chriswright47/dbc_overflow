class Post < ActiveRecord::Base
  attr_accessible :body, :question_id, :title, :user_id
end
