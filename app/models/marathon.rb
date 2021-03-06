class Marathon < ActiveRecord::Base
	has_and_belongs_to_many :users
    attr_accessible :name, :Date, :city, :state, :country, :distance

    validates :name, :city, :state, :country, :distance, presence: true
    validates :name, uniqueness: true

    has_many :photos    
    has_many :user_marathons
    has_many :users, :through => :user_marathons
    
    acts_as_indexed :fields => [:name, :city, :state, :country, :distance]
end
