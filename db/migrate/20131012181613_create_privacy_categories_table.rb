class CreatePrivacyCategoriesTable < ActiveRecord::Migration
  def change
    create_table :privacy_categories do |t|
      t.string :category
    end
  end
end
