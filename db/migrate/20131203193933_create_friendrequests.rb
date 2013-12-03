class CreateFriendrequests < ActiveRecord::Migration
  def change
    create_table :friendrequests do |t|
      t.integer :request_id
      t.integer :receive_id
      t.integer :fr_status

      t.timestamps
    end
  end
end
