class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name , :null=>false
      t.text :description, :null=>false
      t.date :founded_in, :null=>false
      t.string :company_url, :null=>false

      t.timestamps
    end
  end
end
