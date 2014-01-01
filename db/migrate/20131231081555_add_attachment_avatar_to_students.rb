class AddAttachmentAvatarToStudents < ActiveRecord::Migration
  def self.up
    change_table :students do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :students, :avatar
  end
end
