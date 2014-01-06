class CreateTeacherSkillShips < ActiveRecord::Migration
  def change
    create_table :teacher_skill_ships do |t|
    	t.integer :teacher_id
    	t.integer :skill_id
    	t.timestamps
    end
  end
end