class Course < ActiveRecord::Base
	has_many :attends
	has_many :students,:through=>:attends
	#belongs_to :company
	#has_many :teacher, :through=>:company
end
