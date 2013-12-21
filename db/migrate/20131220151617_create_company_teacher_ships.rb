class CreateCompanyTeacherShips < ActiveRecord::Migration
  def change
    create_table :company_teacher_ships do |t|
      t.integer :company_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
