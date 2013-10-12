class CreateFunctionsTable < ActiveRecord::Migration
  def change
    create_table :functions do |t|
      t.string :functions
    end
  end
end
