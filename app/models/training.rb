class Training < ActiveRecord::Base
  attr_accessible :date, :description, :time_spent, :user_id
  
  belongs_to :user
end
