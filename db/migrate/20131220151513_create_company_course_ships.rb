class CreateCompanyCourseShips < ActiveRecord::Migration
  def change
    create_table :company_course_ships do |t|
      t.integer :company_id
      t.integer :course_id

      t.timestamps
    end
  end
end
