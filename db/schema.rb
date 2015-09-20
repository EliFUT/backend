# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150918071053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clubs", force: :cascade do |t|
    t.integer  "base_id",     null: false
    t.string   "name",        null: false
    t.string   "abbrev_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "league_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.integer  "base_id",     null: false
    t.string   "name",        null: false
    t.string   "abbrev_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "nation_id"
  end

  create_table "nations", force: :cascade do |t|
    t.integer  "base_id",    null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "first_name",       null: false
    t.string   "last_name",        null: false
    t.string   "common_name"
    t.integer  "league_id",        null: false
    t.integer  "nation_id",        null: false
    t.integer  "club_id",          null: false
    t.string   "position",         null: false
    t.string   "play_style"
    t.integer  "height",           null: false
    t.integer  "weight",           null: false
    t.string   "birthdate",        null: false
    t.integer  "age",              null: false
    t.integer  "acceleration",     null: false
    t.integer  "aggression",       null: false
    t.integer  "agility",          null: false
    t.integer  "balance",          null: false
    t.integer  "ballcontrol",      null: false
    t.string   "foot",             null: false
    t.integer  "skillMoves",       null: false
    t.integer  "crossing",         null: false
    t.integer  "curve",            null: false
    t.integer  "dribbling",        null: false
    t.integer  "finishing",        null: false
    t.integer  "freekickaccuracy", null: false
    t.integer  "gkdiving",         null: false
    t.integer  "gkhandling",       null: false
    t.integer  "gkkicking",        null: false
    t.integer  "gkpositioning",    null: false
    t.integer  "gkreflexes",       null: false
    t.integer  "headingaccuracy",  null: false
    t.integer  "interceptions",    null: false
    t.integer  "jumping",          null: false
    t.integer  "longpassing",      null: false
    t.integer  "longshots",        null: false
    t.integer  "marking",          null: false
    t.integer  "penalties",        null: false
    t.integer  "positioning",      null: false
    t.integer  "potential",        null: false
    t.integer  "reactions",        null: false
    t.integer  "shortpassing",     null: false
    t.integer  "shotpower",        null: false
    t.integer  "slidingtackle",    null: false
    t.integer  "sprintspeed",      null: false
    t.integer  "standingtackle",   null: false
    t.integer  "stamina",          null: false
    t.integer  "strength",         null: false
    t.integer  "vision",           null: false
    t.integer  "volleys",          null: false
    t.integer  "weak_foot",        null: false
    t.string   "traits"
    t.string   "specialities"
    t.string   "atk_work_rate",    null: false
    t.string   "def_work_rate",    null: false
    t.string   "player_type",      null: false
    t.integer  "attribute_1",      null: false
    t.integer  "attribute_2",      null: false
    t.integer  "attribute_3",      null: false
    t.integer  "attribute_4",      null: false
    t.integer  "attribute_5",      null: false
    t.integer  "attribute_6",      null: false
    t.string   "name",             null: false
    t.string   "quality",          null: false
    t.string   "color",            null: false
    t.boolean  "is_gk",            null: false
    t.string   "position_full",    null: false
    t.boolean  "is_special_type",  null: false
    t.string   "item_type",        null: false
    t.string   "fifa_id",          null: false
    t.integer  "base_id",          null: false
    t.integer  "rating",           null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "players", ["club_id"], name: "index_players_on_club_id", using: :btree

end
