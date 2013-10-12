class CreatePrivacySettingsTable < ActiveRecord::Migration
  def change
    create_table :privacy_settings do |t|
      t.string :setting
    end
  end
end
