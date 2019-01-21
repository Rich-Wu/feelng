# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_01_21_155346) do

  create_table "chat_users", force: :cascade do |t|
    t.integer "chat_room_id"
    t.integer "spotify_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_chat_users_on_chat_room_id"
    t.index ["spotify_user_id"], name: "index_chat_users_on_spotify_user_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "mood"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entries", force: :cascade do |t|
    t.string "mood"
    t.text "photo"
    t.text "playlist"
    t.text "event"
    t.text "poem"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "spotify_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "chatroom_id"
    t.integer "spotify_user_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["spotify_user_id"], name: "index_messages_on_spotify_user_id"
  end

  create_table "spotify_users", force: :cascade do |t|
    t.string "access_token"
    t.string "refresh_token"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "spotify_uri"
    t.string "href"
    t.string "uri"
  end

end
