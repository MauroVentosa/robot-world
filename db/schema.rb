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

ActiveRecord::Schema.define(version: 2021_06_17_011604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_models", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "car_parts", force: :cascade do |t|
    t.bigint "car_id"
    t.boolean "defect"
    t.bigint "part_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_car_parts_on_car_id"
    t.index ["part_id"], name: "index_car_parts_on_part_id"
  end

  create_table "cars", force: :cascade do |t|
    t.integer "price"
    t.integer "costPrice"
    t.integer "year"
    t.bigint "car_model_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_model_id"], name: "index_cars_on_car_model_id"
    t.index ["location_id"], name: "index_cars_on_location_id"
  end

  create_table "factories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.bigint "factory_id", null: false
    t.integer "build_order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "terminal"
    t.index ["factory_id"], name: "index_locations_on_factory_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "client"
    t.bigint "car_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_orders_on_car_id"
  end

  create_table "parts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "location_id", null: false
    t.index ["location_id"], name: "index_parts_on_location_id"
  end

  add_foreign_key "cars", "car_models"
  add_foreign_key "cars", "locations"
  add_foreign_key "locations", "factories"
  add_foreign_key "orders", "cars"
  add_foreign_key "parts", "locations"
end
