class DropStudentSkillShip < ActiveRecord::Migration
  def up
  	drop_table :student_skill_ship
  	drop_table :teacher_skill_ship
  	add_column :student_skill_ships, :student_id, :integer
  	add_column :student_skill_ships, :skill_id, :integer
  end

  def down
  end
end
