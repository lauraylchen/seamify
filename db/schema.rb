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

ActiveRecord::Schema.define(version: 2022_03_01_211549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "seamstress_service_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["seamstress_service_id"], name: "index_order_items_on_seamstress_service_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.datetime "drop_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "seamstress_id", null: false
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["seamstress_id"], name: "index_orders_on_seamstress_id"
  end

  create_table "seamstress_services", force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "seamstress_id", null: false
    t.float "price"
    t.float "estimated_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["seamstress_id"], name: "index_seamstress_services_on_seamstress_id"
    t.index ["service_id"], name: "index_seamstress_services_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "clothing"
    t.string "repair"
    t.string "material"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.text "bio"
    t.string "address"
    t.boolean "seamstress", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "seamstress_services"
  add_foreign_key "orders", "users", column: "client_id"
  add_foreign_key "orders", "users", column: "seamstress_id"
  add_foreign_key "seamstress_services", "services"
  add_foreign_key "seamstress_services", "users", column: "seamstress_id"
end
