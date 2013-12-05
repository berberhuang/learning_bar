class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, :null=>false, :unique=>true
      t.integer :company_id, :null=>false
      t.datetime :course_date, :null=>false
      t.integer :student_amount, :null=>false
      t.string :location, :null=>false
      t.text :agenda, :null=>false

      t.timestamps
    end
    add_index :courses,:name
  end
end
