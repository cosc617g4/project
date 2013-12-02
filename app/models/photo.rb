class Photo < ActiveRecord::Base
  attr_accessible :user_id, :userphoto
  has_attached_file :userphoto, :styles => {:thumb => "75x75", :small => "150x150>"}
  belongs_to :user
  has_many :comments
  has_one :phototag
end
