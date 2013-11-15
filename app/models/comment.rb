class Comment < ActiveRecord::Base
  attr_accessible :message, :photo_id, :user_id
  belongs_to :user
  belongs_to :photo
end
