class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
                :phone, :username, :company, :position, :description
  
  has_many :teaching_course_ships, :dependent=>:destroy
  has_many :courses, :through=>:teaching_course_ships
  has_one :company_teacher_ship, :dependent=>:destroy
  has_one :company, :through=>:company_teacher_ship

end
