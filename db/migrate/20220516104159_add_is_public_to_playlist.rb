class AddIsPublicToPlaylist < ActiveRecord::Migration[7.0]
  def change
    add_column :playlists, :is_public, :string, :default => "1"
  end
end
