class AddAttendRequest < ActiveRecord::Migration
  def change
  	add_column :courses, :attend_request, :text
  end
end
