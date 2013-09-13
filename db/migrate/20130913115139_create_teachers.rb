class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.integer :user_id, :null=>false
      t.integer :company_id, :null=>false
      t.text :description, :null=>false
      t.string :position, :null=>false

      t.timestamps
    end
  end
end
