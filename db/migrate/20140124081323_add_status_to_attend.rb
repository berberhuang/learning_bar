class AddStatusToAttend < ActiveRecord::Migration
  def change
    add_column :attends, :status, :integer

  end
end
