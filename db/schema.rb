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

ActiveRecord::Schema.define(version: 20170116020313) do

 create_table "activities", force: :cascade do |t|
 t.integer "action_id"
 t.string "action_type"
 t.integer "user_id"
 t.datetime "created_at", null: false
 t.datetime "updated_at", null: false
 t.index ["user_id", "created_at"], name: "index_activities_on_user_id_and_created_at"
 t.index ["user_id"], name: "index_activities_on_user_id"
 end

 create_table "average_caches", force: :cascade do |t|
 t.integer "rater_id"
 t.string "rateable_type"
 t.integer "rateable_id"
 t.float "avg", null: false
 t.datetime "created_at"
 t.datetime "updated_at"
 end

 create_table "categories", force: :cascade do |t|
 t.string "name"
 t.datetime "created_at", null: false
 t.datetime "updated_at", null: false
 end

 create_table "comments", force: :cascade do |t|
 t.string "content"
 t.integer "user_id"
 t.integer "product_id"
 t.datetime "created_at", null: false
 t.datetime "updated_at", null: false
 t.index ["product_id"], name: "index_comments_on_product_id"
 t.index ["user_id", "product_id", "created_at"], name: "index_comments_on_user_id_and_product_id_and_created_at"
 t.index ["user_id"], name: "index_comments_on_user_id"
 end

 create_table "order_items", force: :cascade do |t|
 t.integer "quatity"
 t.integer "price"
 t.integer "oder_id"
 t.integer "product_id"
 t.datetime "created_at", null: false
 t.datetime "updated_at", null: false
 t.index ["oder_id", "product_id", "created_at"], name: "index_order_items_on_oder_id_and_product_id_and_created_at"
 t.index ["oder_id"], name: "index_order_items_on_oder_id"
 t.index ["product_id"], name: "index_order_items_on_product_id"
 end

 create_table "orders", force: :cascade do |t|
 t.string "status"
 t.integer "user_id"
 t.datetime "created_at", null: false
 t.datetime "updated_at", null: false
 t.index ["user_id", "created_at"], name: "index_orders_on_user_id_and_created_at"
 t.index ["user_id"], name: "index_orders_on_user_id"
 end

 create_table "overall_averages", force: :cascade do |t|
 t.string "rateable_type"
 t.integer "rateable_id"
 t.float "overall_avg", null: false
 t.datetime "created_at"
 t.datetime "updated_at"
 end

 create_table "products", force: :cascade do |t|
 t.string "name"
 t.string "description"
 t.string "picture"
 t.integer "price"
 t.string "classify"
 t.integer "category_id"
 t.datetime "created_at", null: false
 t.datetime "updated_at", null: false
 t.index ["category_id", "created_at"], name: "index_products_on_category_id_and_created_at"
 t.index ["category_id"], name: "index_products_on_category_id"
 end

 create_table "rates", force: :cascade do |t|
 t.integer "rater_id"
 t.string "rateable_type"
 t.integer "rateable_id"
 t.float "stars", null: false
 t.string "dimension"
 t.datetime "created_at"
 t.datetime "updated_at"
 t.index ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type"
 t.index ["rater_id"], name: "index_rates_on_rater_id"
 end

 create_table "rating_caches", force: :cascade do |t|
 t.string "cacheable_type"
 t.integer "cacheable_id"
 t.float "avg", null: false
 t.integer "qty", null: false
 t.string "dimension"
 t.datetime "created_at"
 t.datetime "updated_at"
 t.index ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type"
 end

 create_table "suggests", force: :cascade do |t|
 t.string "name"
 t.string "picture"
 t.integer "price"
 t.integer "user_id"
 t.datetime "created_at", null: false
 t.datetime "updated_at", null: false
 t.index ["user_id", "created_at"], name: "index_suggests_on_user_id_and_created_at"
 t.index ["user_id"], name: "index_suggests_on_user_id"
 end

 create_table "users", force: :cascade do |t|
 t.string "username"
 t.string "email", default: "", null: false
 t.integer "role", default: 0
 t.string "phone"
 t.string "address"
 t.string "avatar"
 t.string "encrypted_password", default: "", null: false
 t.string "reset_password_token"
 t.datetime "reset_password_sent_at"
 t.datetime "remember_created_at"
 t.integer "sign_in_count", default: 0, null: false
 t.datetime "current_sign_in_at"
 t.datetime "last_sign_in_at"
 t.string "current_sign_in_ip"
 t.string "last_sign_in_ip"
 t.datetime "created_at", null: false
 t.datetime "updated_at", null: false
 t.index ["email"], name: "index_users_on_email", unique: true
 t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
 end

end
