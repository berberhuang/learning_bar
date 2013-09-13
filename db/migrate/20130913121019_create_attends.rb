class CreateAttends < ActiveRecord::Migration
  def change
    create_table :attends do |t|
      t.integer :course_id, :null=>false
      t.integer :student_id, :null=>false

      t.timestamps
    end
  end
end
