class AddDistanceToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :distance, :integer
  end
end
