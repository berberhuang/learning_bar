class Course < ActiveRecord::Base
	has_many :attends, :dependent=>:destroy
	has_many :students,:through=>:attends
	has_many :company_course_ships, :dependent=>:destroy
	has_many :companies, :through=>:company_course_ships
	has_many :teaching_course_ships, :dependent=>:destroy
	has_many :teachers, :through=>:teaching_course_ships
	belongs_to :course_catagory
end
