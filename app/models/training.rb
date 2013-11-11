class Training < ActiveRecord::Base
  attr_accessible :date, :description, :user_id, :distance, :hours, :minutes
  
  belongs_to :user
end
