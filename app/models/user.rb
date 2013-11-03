class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :dob, :default_photo_id, :site_function, :email, :password, :password_confirmation, :remember_me
  has_many :photos
end
