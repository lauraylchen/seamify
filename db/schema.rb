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

ActiveRecord::Schema.define(version: 2022_03_09_163704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "conversations", force: :cascade do |t|
    t.string "name"
    t.bigint "client_id", null: false
    t.bigint "seamstress_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_conversations_on_client_id"
    t.index ["seamstress_id"], name: "index_conversations_on_seamstress_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "conversation_id", null: false
    t.bigint "sender_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "service_id", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["service_id"], name: "index_order_items_on_service_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.datetime "drop_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "seamstress_id", null: false
    t.boolean "confirmed", default: false
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["seamstress_id"], name: "index_orders_on_seamstress_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.bigint "seamstress_id", null: false
    t.bigint "client_id", null: false
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "service"
    t.index ["client_id"], name: "index_reviews_on_client_id"
    t.index ["seamstress_id"], name: "index_reviews_on_seamstress_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "clothing"
    t.string "repair"
    t.string "material"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "price"
    t.float "estimated_time"
    t.bigint "seamstress_id", null: false
    t.index ["seamstress_id"], name: "index_services_on_seamstress_id"
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
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "conversations", "users", column: "client_id"
  add_foreign_key "conversations", "users", column: "seamstress_id"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "services"
  add_foreign_key "orders", "users", column: "client_id"
  add_foreign_key "orders", "users", column: "seamstress_id"
  add_foreign_key "reviews", "users", column: "client_id"
  add_foreign_key "reviews", "users", column: "seamstress_id"
  add_foreign_key "services", "users", column: "seamstress_id"
end
