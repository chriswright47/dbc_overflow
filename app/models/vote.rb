class Vote < ActiveRecord::Base
  attr_accessible :voteable_id, :user_id, :value

  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validates_uniqueness_of :user_id, scope: [:voteable_id, :voteable_type]
end
