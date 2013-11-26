class CreatePhototags < ActiveRecord::Migration
  def change
    create_table :phototags do |t|
      t.integer :photoid
      t.string :tag

      t.timestamps
    end
  end
end
