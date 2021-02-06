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

ActiveRecord::Schema.define(version: 2021_02_05_184948) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bad_guys", force: :cascade do |t|
    t.string "name"
    t.string "story"
    t.integer "xp"
    t.bigint "profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_bad_guys_on_profile_id"
  end

  create_table "chosen_strategies", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "strategy_id", null: false
    t.string "personal_strategic_goal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_chosen_strategies_on_profile_id"
    t.index ["strategy_id"], name: "index_chosen_strategies_on_strategy_id"
  end

  create_table "chosen_visions", force: :cascade do |t|
    t.string "motto"
    t.bigint "profile_id", null: false
    t.bigint "vision_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_chosen_visions_on_profile_id"
    t.index ["vision_id"], name: "index_chosen_visions_on_vision_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_memberships_on_team_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "power_up_visions", force: :cascade do |t|
    t.bigint "chosen_vision_id", null: false
    t.bigint "power_up_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chosen_vision_id"], name: "index_power_up_visions_on_chosen_vision_id"
    t.index ["power_up_id"], name: "index_power_up_visions_on_power_up_id"
  end

  create_table "power_ups", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "profile_id", null: false
    t.integer "xp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_power_ups_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "nickname"
    t.string "secret_bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "quest_strategies", force: :cascade do |t|
    t.bigint "quest_id", null: false
    t.bigint "chosen_strategy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chosen_strategy_id"], name: "index_quest_strategies_on_chosen_strategy_id"
    t.index ["quest_id"], name: "index_quest_strategies_on_quest_id"
  end

  create_table "quests", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.string "name"
    t.integer "completion_rate"
    t.string "description"
    t.integer "xp"
    t.boolean "completed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_quests_on_profile_id"
  end

  create_table "strategies", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_strategies_on_company_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visions", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_visions_on_company_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bad_guys", "profiles"
  add_foreign_key "chosen_strategies", "profiles"
  add_foreign_key "chosen_strategies", "strategies"
  add_foreign_key "chosen_visions", "profiles"
  add_foreign_key "chosen_visions", "visions"
  add_foreign_key "memberships", "teams"
  add_foreign_key "memberships", "users"
  add_foreign_key "power_up_visions", "chosen_visions"
  add_foreign_key "power_up_visions", "power_ups"
  add_foreign_key "power_ups", "profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "quest_strategies", "chosen_strategies"
  add_foreign_key "quest_strategies", "quests"
  add_foreign_key "quests", "profiles"
  add_foreign_key "strategies", "companies"
  add_foreign_key "teams", "users"
  add_foreign_key "users", "companies"
  add_foreign_key "visions", "companies"
end
