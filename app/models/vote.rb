class Vote < ActiveRecord::Base
  attr_accessible :voteable_id, :user_id, :value

  belongs_to :user
  belongs_to :voteable, polymorphic: true
end
