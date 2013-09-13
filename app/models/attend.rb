class Attend < ActiveRecord::Base
	belongs_to :course
	belongs_to :student
end
