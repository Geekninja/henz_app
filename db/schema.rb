# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150530140253) do

  create_table "beneficts", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "default_value"
    t.string   "observation"
    t.boolean  "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "salary"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "office_supports", force: :cascade do |t|
    t.string   "name"
    t.string   "local"
    t.integer  "responsible_id"
    t.string   "geolocation"
    t.string   "observation"
    t.integer  "project_id"
    t.integer  "office_id"
    t.string   "telphone"
    t.string   "telphone_optional"
    t.string   "city"
    t.string   "state"
    t.string   "email"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "office_supports", ["office_id"], name: "index_office_supports_on_office_id"
  add_index "office_supports", ["project_id"], name: "index_office_supports_on_project_id"
  add_index "office_supports", ["responsible_id"], name: "index_office_supports_on_responsible_id"

  create_table "offices", force: :cascade do |t|
    t.string   "cep"
    t.integer  "responsible_id"
    t.string   "geolocation"
    t.string   "city"
    t.string   "state"
    t.string   "telphone"
    t.string   "telphone_optional"
    t.string   "email"
    t.string   "email_optional"
    t.integer  "project_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "offices", ["project_id"], name: "index_offices_on_project_id"
  add_index "offices", ["responsible_id"], name: "index_offices_on_responsible_id"

  create_table "project_categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "project_category_id"
    t.string   "name"
    t.string   "local"
    t.integer  "responsible_id"
    t.string   "geolocation"
    t.text     "description"
    t.text     "observation"
    t.integer  "priority"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "projects", ["project_category_id"], name: "index_projects_on_project_category_id"
  add_index "projects", ["responsible_id"], name: "index_projects_on_responsible_id"

  create_table "sectors", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "acron"
    t.integer  "responsible_id"
    t.boolean  "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "sectors", ["responsible_id"], name: "index_sectors_on_responsible_id"

  create_table "staffs", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.string   "cpf"
    t.string   "job_function"
    t.integer  "job_id"
    t.boolean  "status"
    t.integer  "sector_id"
    t.string   "city"
    t.string   "state"
    t.string   "address"
    t.string   "telphone"
    t.string   "telphone_optional"
    t.string   "celphone"
    t.integer  "project_id"
    t.integer  "office_id"
    t.integer  "office_support_id"
    t.date     "born"
    t.decimal  "salary"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "staffs", ["job_id"], name: "index_staffs_on_job_id"
  add_index "staffs", ["office_id"], name: "index_staffs_on_office_id"
  add_index "staffs", ["office_support_id"], name: "index_staffs_on_office_support_id"
  add_index "staffs", ["project_id"], name: "index_staffs_on_project_id"
  add_index "staffs", ["sector_id"], name: "index_staffs_on_sector_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
