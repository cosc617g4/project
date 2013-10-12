class CreatePrivacyCategoriesTable < ActiveRecord::Migration
  def change
    create_table :privacy_categories do |t|
      #testing commit
      t.string :category
    end
  end
end
