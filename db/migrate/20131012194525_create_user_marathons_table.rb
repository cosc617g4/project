class CreateUserMarathonsTable < ActiveRecord::Migration
  def change
    create_table :user_marathons do |t|
      t.integer :user_id
      t.integer :marathon_id
    end
  end
end
