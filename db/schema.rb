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

ActiveRecord::Schema.define(version: 2021_11_27_133553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "battles", force: :cascade do |t|
    t.bigint "pingochi1_id", null: false
    t.bigint "pingochi2_id", null: false
    t.bigint "pingochi_winner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pingochi1_id"], name: "index_battles_on_pingochi1_id"
    t.index ["pingochi2_id"], name: "index_battles_on_pingochi2_id"
    t.index ["pingochi_winner_id"], name: "index_battles_on_pingochi_winner_id"
  end

  create_table "battles", force: :cascade do |t|
    t.bigint "pingochi1_id", null: false
    t.bigint "pingochi2_id", null: false
    t.bigint "pingochi_winner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pingochi1_id"], name: "index_battles_on_pingochi1_id"
    t.index ["pingochi2_id"], name: "index_battles_on_pingochi2_id"
    t.index ["pingochi_winner_id"], name: "index_battles_on_pingochi_winner_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "pingochi_id", null: false
    t.bigint "item_id"
    t.index ["item_id"], name: "index_inventories_on_item_id"
    t.index ["pingochi_id"], name: "index_inventories_on_pingochi_id"
    t.index ["user_id"], name: "index_inventories_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id", null: false
    t.integer "value"
    t.string "nft"
    t.string "image_url"
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "pingochi_friendships", force: :cascade do |t|
    t.bigint "pingochi_id", null: false
    t.integer "pingochi_friend_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pingochi_id"], name: "index_pingochi_friendships_on_pingochi_id"
  end

  create_table "pingochis", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "live", default: true, null: false
    t.integer "age", default: 0, null: false
    t.string "gender", null: false
    t.integer "energy", default: 100, null: false
    t.string "nft", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "slept_at"
    t.datetime "uti_at"
    t.string "specie"
    t.bigint "item_id"
    t.integer "strength_skill", default: 0, null: false
    t.integer "inteligence_skill", default: 0, null: false
    t.integer "speed_skill", default: 0, null: false
    t.index ["item_id"], name: "index_pingochis_on_item_id"
    t.index ["user_id"], name: "index_pingochis_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nick_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "fishcoin_amount", default: 1000, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "battles", "pingochis", column: "pingochi1_id"
  add_foreign_key "battles", "pingochis", column: "pingochi2_id"
  add_foreign_key "battles", "pingochis", column: "pingochi_winner_id"
  add_foreign_key "inventories", "items"
  add_foreign_key "inventories", "pingochis"
  add_foreign_key "inventories", "users"
  add_foreign_key "items", "categories"
  add_foreign_key "pingochi_friendships", "pingochis"
  add_foreign_key "pingochis", "items"
  add_foreign_key "pingochis", "users"
  add_foreign_key "wallets", "users"
end
