class CreateTeachingCourseShips < ActiveRecord::Migration
  def change
    create_table :teaching_course_ships do |t|
      t.integer :teacher_id
      t.integer :course_id

      t.timestamps
    end
  end
end
