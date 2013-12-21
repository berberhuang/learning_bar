class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :username
      t.string :phone
      t.string :company
      t.text :description
      t.string :position

      t.timestamps
    end
  end
end
