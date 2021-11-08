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

ActiveRecord::Schema.define(version: 2021_11_08_082824) do

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "meal_img_url"
    t.string "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "restaurant_id", null: false
    t.index ["restaurant_id"], name: "index_meals_on_restaurant_id"
  end

  create_table "orders", force: :cascade do |t|
    t.date "date"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "restaurant_id", null: false
    t.integer "meal_id", null: false
    t.index ["meal_id"], name: "index_orders_on_meal_id"
    t.index ["restaurant_id"], name: "index_orders_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "restaurant_img_url"
    t.integer "tables"
    t.text "location"
    t.string "contact"
    t.integer "avail_tables"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "meals", "restaurants"
  add_foreign_key "orders", "meals"
  add_foreign_key "orders", "restaurants"
end
