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

ActiveRecord::Schema.define(version: 20170423060806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bike_parts", force: :cascade do |t|
    t.integer  "bike_id"
    t.integer  "part_id"
    t.float    "service_done_at_bike_distance", default: 0.0
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "service_id"
  end

  add_index "bike_parts", ["bike_id"], name: "index_bike_parts_on_bike_id", using: :btree
  add_index "bike_parts", ["part_id"], name: "index_bike_parts_on_part_id", using: :btree

  create_table "bike_services", force: :cascade do |t|
    t.text     "description"
    t.text     "log"
    t.datetime "due_date"
    t.string   "bike_id"
    t.boolean  "completed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "bikes", force: :cascade do |t|
    t.string   "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
    t.integer  "user_id"
    t.string   "name"
    t.string   "strava_id"
    t.float    "distance"
  end

  create_table "bikes_parts", id: false, force: :cascade do |t|
    t.integer "bike_id"
    t.integer "part_id"
    t.float   "service_done_at_bike_distance"
  end

  add_index "bikes_parts", ["bike_id"], name: "index_bikes_parts_on_bike_id", using: :btree
  add_index "bikes_parts", ["part_id"], name: "index_bikes_parts_on_part_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "name"
    t.integer  "product_id"
    t.string   "phone"
    t.string   "email"
    t.boolean  "payment_received", default: false
    t.string   "bike_brand"
    t.string   "bike_model"
    t.string   "description"
    t.date     "valid_through"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "orders", ["product_id"], name: "index_orders_on_product_id", using: :btree

  create_table "part_services", force: :cascade do |t|
    t.text     "description"
    t.text     "log"
    t.integer  "bike_service_id"
    t.boolean  "completed"
    t.integer  "service_completed_at_milage"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "bike_part_id"
  end

  add_index "part_services", ["bike_service_id"], name: "index_part_services_on_bike_service_id", using: :btree

  create_table "parts", force: :cascade do |t|
    t.string   "brand"
    t.string   "model"
    t.integer  "year"
    t.text     "note"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "tech_doc"
    t.float    "service_interval"
    t.string   "kind"
    t.text     "service_description"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "description"
    t.string   "log"
    t.datetime "due_date"
    t.integer  "bike_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "completed",    default: false
    t.integer  "bike_part_id"
  end

  add_index "services", ["bike_id"], name: "index_services_on_bike_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "mobile"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
    t.string   "role",                 default: "normal"
    t.string   "strava_omniauth_code"
  end

  add_foreign_key "orders", "products"
  add_foreign_key "part_services", "bike_services"
  add_foreign_key "services", "bikes"
end
