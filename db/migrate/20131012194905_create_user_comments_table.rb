class CreateUserCommentsTable < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.string :comment
      t.date :date
      t.integer :private_message
    end
  end
end
