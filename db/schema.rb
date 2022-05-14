# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_14_054808) do
  create_table "listitems", force: :cascade do |t|
    t.string "title"
    t.string "year"
    t.string "released"
    t.string "runtime"
    t.string "genere"
    t.string "writer"
    t.string "actors"
    t.string "plot"
    t.string "language"
    t.string "awards"
    t.string "poster"
    t.string "imdb"
    t.string "type"
    t.string "total_seasons"
    t.string "response"
    t.integer "playlist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playlist_id", "title"], name: "index_listitems_on_playlist_id_and_title", unique: true
    t.index ["playlist_id"], name: "index_listitems_on_playlist_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "title"], name: "index_playlists_on_user_id_and_title", unique: true
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "listitems", "playlists"
  add_foreign_key "playlists", "users"
end
