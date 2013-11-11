class AddHoursMinutesToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :hours, :integer
    add_column :trainings, :minutes, :integer
  end
end
