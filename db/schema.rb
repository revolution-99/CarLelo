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

ActiveRecord::Schema.define(version: 2022_09_03_064609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "car_id"
    t.date "appointment_date", null: false
    t.integer "status", default: 0
    t.boolean "is_approved", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_appointments_on_car_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "cars", force: :cascade do |t|
    t.bigint "user_id"
    t.text "city", null: false
    t.text "brand", null: false
    t.text "model", null: false
    t.text "variant", null: false
    t.text "state", null: false
    t.text "km", null: false
    t.text "year", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "condition", default: "0"
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "maps", force: :cascade do |t|
    t.text "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "car_id"
    t.bigint "appointment_id"
    t.text "action"
    t.datetime "read_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appointment_id"], name: "index_notifications_on_appointment_id"
    t.index ["car_id"], name: "index_notifications_on_car_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "first_name", null: false
    t.text "last_name"
    t.text "email", null: false
    t.text "password_digest", null: false
    t.bigint "mobile_no", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_admin"
    t.boolean "is_seller"
    t.boolean "is_buyer"
    t.boolean "email_confirmed", default: false
    t.text "confirm_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["mobile_no", "is_seller", "is_buyer"], name: "index_users_on_mobile_no_and_is_seller_and_is_buyer", unique: true
  end

end
