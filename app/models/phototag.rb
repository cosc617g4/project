class Phototag < ActiveRecord::Base
  attr_accessible :photoid, :tag
  belongs_to :photo
  validates :tag, numericality: { only_integer: true }
  
  acts_as_indexed :fields => [:photoid, :tag]
end
