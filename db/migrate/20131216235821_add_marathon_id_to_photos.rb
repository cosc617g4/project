class AddMarathonIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :marathon_id, :integer
  end
end
