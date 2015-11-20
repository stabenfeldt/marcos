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

ActiveRecord::Schema.define(version: 20151120130816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bikes", force: :cascade do |t|
    t.string   "brand"
    t.string   "model"
    t.string   "year"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "customer_id"
  end

  add_index "bikes", ["customer_id"], name: "index_bikes_on_customer_id", using: :btree

  create_table "bikes_parts", id: false, force: :cascade do |t|
    t.integer "bike_id"
    t.integer "part_id"
  end

  add_index "bikes_parts", ["bike_id"], name: "index_bikes_parts_on_bike_id", using: :btree
  add_index "bikes_parts", ["part_id"], name: "index_bikes_parts_on_part_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parts", force: :cascade do |t|
    t.string   "brand"
    t.string   "model"
    t.integer  "year"
    t.text     "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "tech_doc"
  end

  create_table "services", force: :cascade do |t|
    t.string   "description"
    t.string   "log"
    t.date     "due_date"
    t.integer  "bike_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "services", ["bike_id"], name: "index_services_on_bike_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "mobile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bikes", "customers"
  add_foreign_key "services", "bikes"
end
