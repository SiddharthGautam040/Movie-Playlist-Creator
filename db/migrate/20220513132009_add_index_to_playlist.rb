class AddIndexToPlaylist < ActiveRecord::Migration[7.0]
  def change
    add_index :playlists, [:user_id, :title], unique: true
  end
end
