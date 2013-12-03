class DropUserMarathonsTable < ActiveRecord::Migration
  def up
    drop_table :user_marathons
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
