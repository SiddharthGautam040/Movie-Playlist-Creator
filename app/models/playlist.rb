class Playlist < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :title, uniqueness: { scope: :user_id, message: "already exists" }

end
