class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.text :description, :null=>false
      t.integer :user_id, :null=>false

      t.timestamps
    end
  end
end
