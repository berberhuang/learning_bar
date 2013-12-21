class CompanyCourseShip < ActiveRecord::Base
	belongs_to :company
	belongs_to :course
end
