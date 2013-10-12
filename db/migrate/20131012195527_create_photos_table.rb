class CreatePhotosTable < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image_location
    end
  end
end
