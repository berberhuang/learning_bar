class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username,:phone,:email, :password, :password_confirmation, :remember_me
  attr_accessible :description

  has_many :attends
  has_many :courses,:through=>:attends
end
