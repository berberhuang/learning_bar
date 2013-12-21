class Company < ActiveRecord::Base
	has_many :company_course_ships, :dependent=>:destroy
	has_many :courses, :through => :company_course_ships
	has_many :company_teacher_ships, :dependent=>:destroy
	has_many :teachers, :through => :company_teacher_ships
	has_many :attends, :through => :courses
end
