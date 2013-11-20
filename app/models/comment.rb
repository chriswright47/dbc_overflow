class Comment < ActiveRecord::Base
  attr_accessible :body, :post_id, :user_id
end
