class CreateUserPrivacySettingsTable < ActiveRecord::Migration
  def change
    create_table :user_privacy_settings do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :setting_id
    end
  end
end
