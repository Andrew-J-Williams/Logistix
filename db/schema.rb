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

ActiveRecord::Schema.define(version: 2020_05_03_205230) do

  create_table "carriers", force: :cascade do |t|
    t.string "service_type"
    t.integer "pending_shipments"
    t.integer "delivered_shipments"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.integer "carrier_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["carrier_id"], name: "index_services_on_carrier_id"
  end

  create_table "shipments", force: :cascade do |t|
    t.integer "quantity"
    t.integer "total_weight"
    t.date "ship_date"
    t.integer "tracking_number"
    t.string "status"
    t.integer "user_id", null: false
    t.integer "carrier_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "customer"
    t.string "address"
    t.string "contact"
    t.index ["carrier_id"], name: "index_shipments_on_carrier_id"
    t.index ["user_id"], name: "index_shipments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "services", "carriers"
  add_foreign_key "shipments", "carriers"
  add_foreign_key "shipments", "users"
end
