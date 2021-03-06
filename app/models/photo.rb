class Photo < ActiveRecord::Base
  attr_accessible :user_id, :userphoto, :marathon_id
  has_attached_file :userphoto, :styles => {:thumb => "75x75", :small => "150x150>"}
  belongs_to :user
  belongs_to :marathon
  has_many :comments, :dependent=>:delete_all
  has_one :phototag
end
