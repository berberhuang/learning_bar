class AddSlugColumnToCourseCatagory < ActiveRecord::Migration
  def change
  	add_column :course_catagories, :slug, :string
  	add_index :course_catagories, :slug, unique: true
  end
end
