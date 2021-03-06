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

ActiveRecord::Schema.define(version: 2022_07_09_142027) do

  create_table "appointments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "car_id"
    t.date "appointment_date"
    t.integer "status", default: 0
    t.boolean "is_approved", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_appointments_on_car_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "cars", force: :cascade do |t|
    t.integer "user_id"
    t.string "city"
    t.string "brand"
    t.string "model"
    t.string "variant"
    t.string "state"
    t.string "km"
    t.string "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "maps", force: :cascade do |t|
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_id"
    t.integer "car_id"
    t.integer "appointment_id"
    t.string "action"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appointment_id"], name: "index_notifications_on_appointment_id"
    t.index ["car_id"], name: "index_notifications_on_car_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.integer "mobile_no"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_admin"
    t.boolean "is_seller"
    t.boolean "is_buyer"
    t.boolean "email_confirmed"
    t.string "confirm_token"
  end

end
