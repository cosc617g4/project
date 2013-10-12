class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :user_name
      t.string :password
      t.integer :default_photo_id
      t.integer :site_function_id
      t.integer :locked
      t.string :email_address
    end
  end
end
