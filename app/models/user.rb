class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :dob, :default_photo_id, :site_function, :email, :password, :password_confirmation, :remember_me
  has_many :photos

  def fullname
    return "#{first_name} #{last_name}"
  end

  #comments
  has_many :comments
  
  # Friend
  #has_and_belongs_to_many :users
  has_many :friendships
  has_many :users, :through => :friendships

  #marathon
  has_and_belongs_to_many :marathons
  

  has_many :trainings

  acts_as_messageable 
end
