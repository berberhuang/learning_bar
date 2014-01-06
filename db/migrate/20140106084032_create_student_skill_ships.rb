class CreateStudentSkillShips < ActiveRecord::Migration
  def change
    create_table :student_skill_ships do |t|

      t.timestamps
    end
  end
end
