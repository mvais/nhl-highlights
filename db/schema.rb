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

ActiveRecord::Schema[7.0].define(version: 2022_07_03_173149) do
  create_table "highlights", force: :cascade do |t|
    t.integer "nhl_event_id"
    t.integer "nhl_game_id"
    t.integer "nhl_season_id"
    t.integer "player_id", null: false
    t.integer "team_id", null: false
    t.date "date"
    t.json "playback"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_highlights_on_player_id"
    t.index ["team_id"], name: "index_highlights_on_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "nationality"
    t.string "position"
    t.string "nhl_player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.integer "franchise_id"
    t.integer "team_id"
    t.string "name"
    t.string "code"
    t.string "city"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "highlights", "players"
  add_foreign_key "highlights", "teams"
end
