class CreateUserphotos < ActiveRecord::Migration
  def change
    create_table :userphotos do |t|
      t.integer :photoid
      t.integer :userid

      t.timestamps
    end
  end
end
