class Skills < ActiveRecord::Migration
  def up
  	create_table :student_skill_ship do |t|
  		t.integer :student_id
  		t.integer :skill_id
  	end
  	create_table :teacher_skill_ship do |t|
  		t.integer :teacher_id
  		t.integer :skill_id
  	end
  	create_table :skills do |t|
  		t.string :skill_name
  	end
  end

  def down
  end
end
