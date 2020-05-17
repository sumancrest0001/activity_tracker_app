# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_29_131338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "main_activities", force: :cascade do |t|
    t.string "title"
    t.date "recorded"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_main_activities_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "sleep"
    t.integer "work"
    t.integer "cook"
    t.integer "exercise"
    t.integer "watch"
    t.integer "read"
    t.bigint "main_activity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["main_activity_id"], name: "index_tasks_on_main_activity_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "main_activities", "users"
  add_foreign_key "tasks", "main_activities"
end
