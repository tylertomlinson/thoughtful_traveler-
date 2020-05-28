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

ActiveRecord::Schema.define(version: 2020_05_28_221758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string "google_place_id"
    t.string "name"
    t.string "address"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_places_on_event_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.integer "event"
    t.integer "food"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trip_events", force: :cascade do |t|
    t.bigint "trip_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_trip_events_on_event_id"
    t.index ["trip_id"], name: "index_trip_events_on_trip_id"
  end

  create_table "trip_preferences", force: :cascade do |t|
    t.bigint "trip_id"
    t.bigint "preference_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["preference_id"], name: "index_trip_preferences_on_preference_id"
    t.index ["trip_id"], name: "index_trip_preferences_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_trips", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_user_trips_on_trip_id"
    t.index ["user_id"], name: "index_user_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "places", "events"
  add_foreign_key "trip_events", "events"
  add_foreign_key "trip_events", "trips"
  add_foreign_key "trip_preferences", "preferences"
  add_foreign_key "trip_preferences", "trips"
  add_foreign_key "user_trips", "trips"
  add_foreign_key "user_trips", "users"
end
