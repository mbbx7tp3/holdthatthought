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

ActiveRecord::Schema.define(version: 2020_02_20_204459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blacklist_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "blacklist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blacklist_id"], name: "index_blacklist_users_on_blacklist_id"
    t.index ["user_id"], name: "index_blacklist_users_on_user_id"
  end

  create_table "blacklists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "website_name"
    t.string "website_url"
    t.string "description"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flashcard_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "flashcard_id"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flashcard_id"], name: "index_flashcard_users_on_flashcard_id"
    t.index ["user_id"], name: "index_flashcard_users_on_user_id"
  end

  create_table "flashcards", force: :cascade do |t|
    t.bigint "category_id"
    t.string "question"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_flashcards_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "interest"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "blacklist_users", "blacklists"
  add_foreign_key "blacklist_users", "users"
  add_foreign_key "flashcard_users", "flashcards"
  add_foreign_key "flashcard_users", "users"
  add_foreign_key "flashcards", "categories"
end
