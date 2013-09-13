class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, :null=>false
      t.integer :company_id, :null=>false
      t.datetime :course_date, :null=>false
      t.integer :student_amount, :null=>false
      t.string :location, :null=>false
      t.text :agenda, :null=>false

      t.timestamps
    end
  end
end
