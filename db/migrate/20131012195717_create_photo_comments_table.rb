class CreatePhotoCommentsTable < ActiveRecord::Migration
  def change
    create_table :photos_comments do |t|
      t.integer :user_photo_id
      t.integer :from_user_id
      t.date :date
      t.string :comment
    end
  end
end
