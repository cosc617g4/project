class Training < ActiveRecord::Base
  attr_accessible :date, :description, :user_id, :distance, :hours, :minutes
  
  belongs_to :user
  
  validates :date, :description, :user_id, :distance, :hours, :minutes, presence: true
  validates :distance, :numericality => {:only_integer => true, :greater_than => 0}
  validates :hours, :numericality => {:only_integer => true}
  validates :minutes, :numericality => {:only_integer => true}
  
  
end
