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

ActiveRecord::Schema.define(version: 2020_04_11_175806) do

  create_table "friends", force: :cascade do |t|
    t.integer "from_id"
    t.integer "to_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["from_id", "to_id"], name: "index_friends_on_from_id_and_to_id", unique: true
    t.index ["from_id"], name: "index_friends_on_from_id"
    t.index ["to_id"], name: "index_friends_on_to_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "short_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "website"], name: "index_members_on_name_and_website", unique: true
  end

  create_table "topics", force: :cascade do |t|
    t.string "content"
    t.string "heading_tag"
    t.integer "member_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_topics_on_member_id"
  end

  add_foreign_key "friends", "members", column: "from_id"
  add_foreign_key "friends", "members", column: "to_id"
end
