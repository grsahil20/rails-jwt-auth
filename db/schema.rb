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

ActiveRecord::Schema.define(version: 2021_07_13_204034) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "follower_ships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "follower_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["follower_id"], name: "index_follower_ships_on_follower_id"
    t.index ["user_id"], name: "index_follower_ships_on_user_id"
  end

  create_table "jwt_blacklists", force: :cascade do |t|
    t.string "jti"
    t.string "aud"
    t.datetime "exp"
    t.bigint "users_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["jti"], name: "index_jwt_blacklists_on_jti"
    t.index ["users_id"], name: "index_jwt_blacklists_on_users_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.string "body"
    t.bigint "user_id", null: false
    t.integer "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_tweets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "follower_ships", "users"
  add_foreign_key "follower_ships", "users", column: "follower_id"
  add_foreign_key "jwt_blacklists", "users", column: "users_id", on_delete: :cascade
  add_foreign_key "tweets", "users"
end
