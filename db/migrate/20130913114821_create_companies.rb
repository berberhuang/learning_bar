class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name , :null=>false
      t.text :description
      t.date :founded_in
      t.string :company_url

      t.timestamps
    end
  end
end
