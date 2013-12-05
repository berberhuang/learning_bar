class AddPhoneAndUsernameToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :phone, :string

    add_column :admins, :username, :string

  end
end
