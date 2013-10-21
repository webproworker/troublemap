class AddAttachmentPhotoToTroubles < ActiveRecord::Migration
  def self.up
    change_table :troubles do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :troubles, :photo
  end
end
