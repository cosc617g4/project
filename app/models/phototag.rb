class Phototag < ActiveRecord::Base
  attr_accessible :photoid, :tag
  belongs_to :photo
end
