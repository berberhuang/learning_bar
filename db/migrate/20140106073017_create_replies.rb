class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
    	t.integer :post_id
    	t.integer :student_id
    	t.integer :teacher_id
    	t.text :content
      t.timestamps
    end
  end
end
