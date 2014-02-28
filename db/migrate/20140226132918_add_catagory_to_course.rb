class AddCatagoryToCourse < ActiveRecord::Migration
  def change
  	add_column :courses, :course_catagory_id, :integer 
  end
end
