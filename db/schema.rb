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

ActiveRecord::Schema[7.0].define(version: 2024_02_14_161813) do
  create_table "accounts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "phone"
    t.string "location"
    t.string "about"
    t.string "role"
    t.string "linkedin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "applications", force: :cascade do |t|
    t.string "resume"
    t.string "cover_letter"
    t.string "status"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id", null: false
    t.integer "job_id", null: false
    t.index ["account_id"], name: "index_applications_on_account_id"
    t.index ["job_id"], name: "index_applications_on_job_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "title"
    t.text "about"
    t.text "benefits"
    t.string "industry"
    t.string "website"
    t.string "location"
    t.string "email"
    t.string "phone"
    t.string "linkedin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "location"
    t.string "categoty"
    t.boolean "remote"
    t.float "salary"
    t.text "requirements"
    t.text "responsibilities"
    t.date "application_deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "views", default: 0
    t.integer "company_id", null: false
    t.index ["company_id"], name: "index_jobs_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "applications", "accounts"
  add_foreign_key "applications", "jobs"
  add_foreign_key "companies", "users"
  add_foreign_key "jobs", "companies"
end
