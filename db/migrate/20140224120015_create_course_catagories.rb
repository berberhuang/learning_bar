class CreateCourseCatagories < ActiveRecord::Migration
  def change
    create_table :course_catagories do |t|
      t.string :name

      t.timestamps
    end
  end
end
