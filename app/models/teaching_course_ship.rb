class TeachingCourseShip < ActiveRecord::Base
	belongs_to :teacher
	belongs_to :course
end
