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

ActiveRecord::Schema.define(version: 2022_03_03_200246) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_professionals", force: :cascade do |t|
    t.string "org_name"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_num"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid"
    t.string "picture"
  end

  create_table "calendars", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.date "date"
    t.string "name"
    t.string "location"
    t.time "start_time"
    t.string "description"
    t.integer "event_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.time "finish_time"
  end

  create_table "newsletters", force: :cascade do |t|
    t.date "date_posted"
    t.string "message"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "student_members", force: :cascade do |t|
    t.string "uin"
    t.string "first_name"
    t.string "last_name"
    t.string "class_year"
    t.date "join_date"
    t.integer "member_title"
    t.string "email"
    t.string "phone_number"
    t.date "expected_graduation_date"
    t.integer "social_point_amount"
    t.integer "meeting_point_amount"
    t.integer "fundraiser_point_amount"
    t.integer "informational_point_amount"
    t.string "officer_title"
    t.boolean "dues_paid"
    t.binary "picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "full_name"
    t.string "uid"
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
