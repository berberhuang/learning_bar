class AddCourseExpectToAttend < ActiveRecord::Migration
  def change
    add_column :attends, :course_expect, :text

  end
end
