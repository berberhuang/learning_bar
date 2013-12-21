class CompanyTeacherShip < ActiveRecord::Base
	belongs_to :company
	belongs_to :teacher
end
