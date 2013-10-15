class AddOwnerIdToPhotosTable < ActiveRecord::Migration
  def change
    add_colum :photos, :owner_id, :integer
  end
end
