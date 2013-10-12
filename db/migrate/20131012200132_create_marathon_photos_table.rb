class CreateMarathonPhotosTable < ActiveRecord::Migration
  def change
    create_table :marathon_photos do |t|
      t.integer :marathon_id
      t.integer :photo_id
      t.string :bib_number
    end
  end
end
