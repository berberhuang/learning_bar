class Company < ActiveRecord::Base
	has_many :courses
	has_many :teachers
	has_many :attends, :through => :courses
end
