class RemoveColumnFromTrainings < ActiveRecord::Migration
  def change
    remove_column :trainings, :time_spent
  end

end
