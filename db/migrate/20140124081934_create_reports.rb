class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :attend_id
      t.text :reason

      t.timestamps
    end
  end
end
