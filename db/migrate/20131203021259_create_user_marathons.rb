class CreateUserMarathons < ActiveRecord::Migration
  def change
    create_table :user_marathons do |t|
      t.integer :user_id
      t.integer :marathon_id
      t.integer :hours
      t.integer :minutes
      t.integer :place

      t.timestamps
    end
    
    add_index :user_marathons, :user_id
  end
end
