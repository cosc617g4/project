class CreateUserPhotosTable < ActiveRecord::Migration
  def change
    create_table :user_photos do |t|
      
      t.integer :photo_id
      t.integer :user_id
    end
  end
end
