class Marathon < ActiveRecord::Base
	has_and_belongs_to_many :users
    attr_accessible :name, :date, :city, :state, :country, :distance
end