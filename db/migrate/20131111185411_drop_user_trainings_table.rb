class DropUserTrainingsTable < ActiveRecord::Migration
  def change
    drop_table :user_training
  end
end
