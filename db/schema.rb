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

ActiveRecord::Schema.define(version: 20150706160933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "archives", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name"
    t.string   "description"
    t.string   "observation"
    t.string   "file_path"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "archives", ["project_id"], name: "index_archives_on_project_id", using: :btree

  create_table "beneficts", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "default_value"
    t.string   "observation"
    t.boolean  "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "bill_categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bill_products", force: :cascade do |t|
    t.integer  "bill_id"
    t.string   "title"
    t.integer  "type_product"
    t.string   "description"
    t.float    "value"
    t.integer  "quantity"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "bill_products", ["bill_id"], name: "index_bill_products_on_bill_id", using: :btree

  create_table "budgets", force: :cascade do |t|
    t.integer  "quotation_id"
    t.integer  "supplier_id"
    t.string   "note"
    t.decimal  "value"
    t.date     "date"
    t.integer  "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "budgets", ["quotation_id"], name: "index_budgets_on_quotation_id", using: :btree
  add_index "budgets", ["supplier_id"], name: "index_budgets_on_supplier_id", using: :btree

  create_table "fuel_expenses", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "vehicle_id"
    t.integer  "km_start"
    t.integer  "km_end"
    t.float    "fuel_price_lt"
    t.float    "fuel_lt"
    t.date     "date"
    t.boolean  "status"
    t.string   "note"
    t.text     "observations"
    t.integer  "supplier_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "fuel_expenses", ["project_id"], name: "index_fuel_expenses_on_project_id", using: :btree
  add_index "fuel_expenses", ["supplier_id"], name: "index_fuel_expenses_on_supplier_id", using: :btree
  add_index "fuel_expenses", ["vehicle_id"], name: "index_fuel_expenses_on_vehicle_id", using: :btree

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

  add_index "office_supports", ["office_id"], name: "index_office_supports_on_office_id", using: :btree
  add_index "office_supports", ["project_id"], name: "index_office_supports_on_project_id", using: :btree
  add_index "office_supports", ["responsible_id"], name: "index_office_supports_on_responsible_id", using: :btree

  create_table "offices", force: :cascade do |t|
    t.string   "name"
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

  add_index "offices", ["project_id"], name: "index_offices_on_project_id", using: :btree
  add_index "offices", ["responsible_id"], name: "index_offices_on_responsible_id", using: :btree

  create_table "pays", force: :cascade do |t|
    t.integer  "bill_category_id"
    t.integer  "project_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "status",              default: false
    t.string   "value"
    t.integer  "supplier_id"
    t.text     "observation"
    t.date     "deadline"
    t.string   "archive"
    t.string   "note_payment"
    t.date     "date_payment"
    t.text     "observation_payment"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "pays", ["bill_category_id"], name: "index_pays_on_bill_category_id", using: :btree
  add_index "pays", ["project_id"], name: "index_pays_on_project_id", using: :btree
  add_index "pays", ["supplier_id"], name: "index_pays_on_supplier_id", using: :btree

  create_table "project_categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_finances", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "finance_type"
    t.float    "value"
    t.boolean  "status"
    t.string   "title"
    t.string   "description"
    t.string   "quantity"
    t.integer  "month"
    t.integer  "year"
    t.date     "date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "project_finances", ["project_id"], name: "index_project_finances_on_project_id", using: :btree

  create_table "project_funds", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "status",              default: false
    t.string   "value"
    t.integer  "supplier_id"
    t.text     "observation"
    t.string   "note_payment"
    t.date     "date_payment"
    t.text     "observation_payment"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "project_funds", ["project_id"], name: "index_project_funds_on_project_id", using: :btree
  add_index "project_funds", ["supplier_id"], name: "index_project_funds_on_supplier_id", using: :btree

  create_table "project_users", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "project_users", ["project_id"], name: "index_project_users_on_project_id", using: :btree
  add_index "project_users", ["user_id"], name: "index_project_users_on_user_id", using: :btree

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

  add_index "projects", ["project_category_id"], name: "index_projects_on_project_category_id", using: :btree
  add_index "projects", ["responsible_id"], name: "index_projects_on_responsible_id", using: :btree

  create_table "quotations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date"
    t.integer  "project_id"
    t.integer  "responsible_id"
    t.boolean  "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "quotations", ["project_id"], name: "index_quotations_on_project_id", using: :btree
  add_index "quotations", ["responsible_id"], name: "index_quotations_on_responsible_id", using: :btree

  create_table "receipts", force: :cascade do |t|
    t.integer  "bill_category_id"
    t.integer  "project_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "status",              default: false
    t.string   "value"
    t.text     "observation"
    t.date     "deadline"
    t.string   "archive"
    t.date     "date_payment"
    t.text     "observation_receipt"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "receipts", ["bill_category_id"], name: "index_receipts_on_bill_category_id", using: :btree
  add_index "receipts", ["project_id"], name: "index_receipts_on_project_id", using: :btree

  create_table "sectors", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "acron"
    t.integer  "responsible_id"
    t.boolean  "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "sectors", ["responsible_id"], name: "index_sectors_on_responsible_id", using: :btree

  create_table "staff_projects", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "staff_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "staff_projects", ["project_id"], name: "index_staff_projects_on_project_id", using: :btree
  add_index "staff_projects", ["staff_id"], name: "index_staff_projects_on_staff_id", using: :btree

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
    t.date     "born"
    t.decimal  "salary"
    t.boolean  "driver"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "staffs", ["job_id"], name: "index_staffs_on_job_id", using: :btree
  add_index "staffs", ["sector_id"], name: "index_staffs_on_sector_id", using: :btree

  create_table "supplier_categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.boolean  "protected"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.string   "cnpj"
    t.string   "state_number"
    t.string   "city_number"
    t.string   "city"
    t.string   "state"
    t.string   "cep"
    t.string   "contact_name"
    t.string   "contact_telphone"
    t.string   "contact_email"
    t.string   "telphone"
    t.string   "telphone_optional"
    t.string   "email"
    t.string   "email_optional"
    t.text     "observations"
    t.integer  "supplier_category_id"
    t.integer  "supplier_importance"
    t.integer  "project_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "suppliers", ["project_id"], name: "index_suppliers_on_project_id", using: :btree
  add_index "suppliers", ["supplier_category_id"], name: "index_suppliers_on_supplier_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "function"
    t.boolean  "status",                 default: true
    t.integer  "privilege"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vehicle_categories", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_services", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name"
    t.string   "description"
    t.integer  "vehicle_service_id"
    t.integer  "vehicle_type"
    t.integer  "vehicle_category_id"
    t.text     "observations"
    t.date     "acquired"
    t.string   "state"
    t.string   "fuel"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "vehicles", ["project_id"], name: "index_vehicles_on_project_id", using: :btree
  add_index "vehicles", ["vehicle_category_id"], name: "index_vehicles_on_vehicle_category_id", using: :btree
  add_index "vehicles", ["vehicle_service_id"], name: "index_vehicles_on_vehicle_service_id", using: :btree

end
