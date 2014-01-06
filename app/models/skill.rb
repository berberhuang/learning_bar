class Skill < ActiveRecord::Base
	has_many :student_skill_ships
	has_many :teacher_skill_ships
	has_many :students, :through=>:student_skill_ships
	has_many :teachers, :through=>:teacher_skill_ships
end
