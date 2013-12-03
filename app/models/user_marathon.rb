class UserMarathon < ActiveRecord::Base
  attr_accessible :user_id, :marathon_id, :hours, :minutes, :place
  
  validates :user_id, :marathon_id, :hours, :minutes, :place, presence: true
  validates_uniqueness_of :user_id, :scope => :marathon_id
  
  belongs_to :user 
  belongs_to :marathon
end
