class AddTeacherIdToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :teacher_id, :integer
  end
end
