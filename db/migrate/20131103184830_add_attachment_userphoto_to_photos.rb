class AddAttachmentUserphotoToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.attachment :userphoto
    end
  end

  def self.down
    drop_attached_file :photos, :userphoto
  end
end
