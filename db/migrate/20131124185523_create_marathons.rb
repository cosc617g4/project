class CreateMarathons < ActiveRecord::Migration
  def change
    create_table :marathons do |t|

      t.string :name
      t.date :Date
      t.string :city
      t.string :state
      t.string :country
      t.decimal :distance
      t.timestamps
    end
  end
end
