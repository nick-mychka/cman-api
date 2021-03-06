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

ActiveRecord::Schema[7.0].define(version: 2022_07_02_163217) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clusters", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "view_order"
    t.index ["user_id"], name: "index_clusters_on_user_id"
  end

  create_table "coin_widgets", force: :cascade do |t|
    t.bigint "cluster_id"
    t.string "base_currency"
    t.string "quote_currency"
    t.string "change_up_to", default: "off"
    t.string "change_down_to", default: "off"
    t.string "exchange_id"
    t.text "trade_history", default: [], array: true
    t.text "notification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "view_order"
    t.string "base_currency_id"
    t.string "quote_currency_id"
    t.index ["cluster_id"], name: "index_coin_widgets_on_cluster_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "password_digest", default: "", null: false
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "clusters", "users"
  add_foreign_key "coin_widgets", "clusters"
end
