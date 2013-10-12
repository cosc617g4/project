class CreateUserTrainingTable < ActiveRecord::Migration
  def change
    create_table :user_training do |t|
      t.integer :user_id
      t.date :Date
      t.string :Detail
      t.string :category
    end
  end
end
