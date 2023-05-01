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

ActiveRecord::Schema[7.0].define(version: 2023_05_01_043249) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "followers", force: :cascade do |t|
    t.bigint "follower_id"
    t.bigint "followee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followee_id"], name: "index_followers_on_followee_id"
    t.index ["follower_id"], name: "index_followers_on_follower_id"
  end

  create_table "records", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "clock_in", null: false
    t.datetime "clock_out"
    t.decimal "duration"
    t.boolean "complete", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "follower_id"
    t.bigint "followee_id"
    t.index ["followee_id"], name: "index_users_on_followee_id"
    t.index ["follower_id"], name: "index_users_on_follower_id"
  end

  add_foreign_key "followers", "users", column: "followee_id"
  add_foreign_key "followers", "users", column: "follower_id"
  add_foreign_key "records", "users"
end
