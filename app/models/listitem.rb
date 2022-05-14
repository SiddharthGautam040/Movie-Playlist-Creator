class Listitem < ApplicationRecord
  belongs_to :playlist
  validates :title, uniqueness: { scope: :playlist_id, message: "already exists in this playlist" }
end
