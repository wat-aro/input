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

ActiveRecord::Schema.define(version: 2021_07_11_081417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "review_id", null: false
    t.string "path", null: false
    t.integer "position"
    t.string "body", null: false
    t.integer "line"
    t.string "side"
    t.integer "start_line"
    t.integer "start_side"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["review_id"], name: "index_comments_on_review_id"
  end

  create_table "pull_requests", force: :cascade do |t|
    t.bigint "repository_id", null: false
    t.bigint "number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["repository_id", "number"], name: "index_pull_requests_on_repository_id_and_number", unique: true
    t.index ["repository_id"], name: "index_pull_requests_on_repository_id"
  end

  create_table "repositories", force: :cascade do |t|
    t.string "name", null: false
    t.string "owner_type", null: false
    t.bigint "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_repositories_on_name", unique: true
    t.index ["owner_type", "owner_id"], name: "index_repositories_on_owner"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "pull_request_id", null: false
    t.string "commit_id", null: false
    t.string "body"
    t.string "event", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pull_request_id"], name: "index_reviews_on_pull_request_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  add_foreign_key "comments", "reviews"
  add_foreign_key "pull_requests", "repositories"
  add_foreign_key "reviews", "pull_requests"
end
