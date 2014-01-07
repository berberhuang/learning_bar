class AddSkillDescriptionToStudentskillship < ActiveRecord::Migration
  def change
  	add_column :student_skill_ships, :skill_description, :text
  	add_column :teacher_skill_ships, :skill_description, :text
  end
end
