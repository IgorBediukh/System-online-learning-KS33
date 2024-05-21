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

ActiveRecord::Schema[7.1].define(version: 2024_05_20_232658) do
  create_table "business_models", force: :cascade do |t|
    t.string "name"
    t.integer "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "captain_id"
    t.index ["captain_id"], name: "index_business_models_on_captain_id"
    t.index ["user_id"], name: "index_business_models_on_user_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "business_model_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_model_id"], name: "index_enrollments_on_business_model_id"
    t.index ["user_id", "business_model_id"], name: "index_enrollments_on_user_id_and_business_model_id", unique: true
    t.index ["user_id"], name: "index_enrollments_on_user_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "lesson_type", null: false
    t.datetime "lesson_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "business_model_id", null: false
    t.index ["business_model_id"], name: "index_lessons_on_business_model_id"
  end

  create_table "user_lessons", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "lesson_id", null: false
    t.integer "grade"
    t.boolean "attendance", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_user_lessons_on_lesson_id"
    t.index ["user_id"], name: "index_user_lessons_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "business_models", "users"
  add_foreign_key "business_models", "users", column: "captain_id"
  add_foreign_key "enrollments", "business_models"
  add_foreign_key "enrollments", "users"
  add_foreign_key "lessons", "business_models"
  add_foreign_key "user_lessons", "lessons"
  add_foreign_key "user_lessons", "users"
end
