class AddPhoneAndUsernameToStudent < ActiveRecord::Migration
  def change
    add_column :students, :phone, :string

    add_column :students, :username, :string

  end
end
