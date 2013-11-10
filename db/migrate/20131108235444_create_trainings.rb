class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.date :date
      t.integer :time_spent
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
