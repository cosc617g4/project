class Friendrequest < ActiveRecord::Base
  # status: 1 pending, 2 declined, 3 accepted
  attr_accessible :fr_status, :receive_id, :request_id
  belongs_to :request, :class_name => :User
  belongs_to :receive, :class_name => :User
end
