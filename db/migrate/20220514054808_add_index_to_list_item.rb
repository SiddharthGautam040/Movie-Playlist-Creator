class AddIndexToListItem < ActiveRecord::Migration[7.0]
  def change
    add_index :listitems, [:playlist_id, :title], unique: true
  end
end
