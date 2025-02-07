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

ActiveRecord::Schema[7.2].define(version: 2025_02_05_063936) do
  create_table "bookings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "turf_id", null: false
    t.integer "time_slot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["time_slot_id"], name: "index_bookings_on_time_slot_id"
    t.index ["turf_id"], name: "index_bookings_on_turf_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "turf_id", null: false
    t.integer "user_id", null: false
    t.text "review", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["turf_id"], name: "index_reviews_on_turf_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "time_slots", force: :cascade do |t|
    t.integer "turf_id", null: false
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["turf_id"], name: "index_time_slots_on_turf_id"
  end

  create_table "turves", force: :cascade do |t|
    t.string "name", null: false
    t.string "location", null: false
    t.datetime "opening_time", null: false
    t.datetime "close_time", null: false
    t.boolean "status", null: false
    t.integer "user_id", null: false
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_turves_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "phone_number", limit: 10, null: false
    t.integer "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "status", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "bookings", "time_slots"
  add_foreign_key "bookings", "turves"
  add_foreign_key "bookings", "users"
  add_foreign_key "reviews", "turves"
  add_foreign_key "reviews", "users"
  add_foreign_key "time_slots", "turves"
  add_foreign_key "turves", "users"
  add_foreign_key "users", "roles"
end
