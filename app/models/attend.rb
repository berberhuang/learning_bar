class Attend < ActiveRecord::Base
	# attr_accessible :status
	
	belongs_to :course
	belongs_to :student
	has_one :report
end
