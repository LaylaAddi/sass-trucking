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

ActiveRecord::Schema.define(version: 20160929044746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "telephone"
    t.string   "website"
    t.string   "logo"
    t.integer  "company_manager_id"
    t.string   "company_type"
    t.boolean  "has_broker_mc",      default: false
    t.boolean  "has_carrier_mc",     default: false
    t.date     "date_formed"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "operating_authorities", force: :cascade do |t|
    t.string   "entity_type"
    t.string   "type"
    t.string   "operating_status"
    t.string   "out_of_service_date"
    t.string   "legal_name"
    t.string   "dba_name"
    t.string   "physical_address"
    t.string   "phone"
    t.string   "mailing_address"
    t.string   "usdot_number"
    t.string   "state_carrier_id_number"
    t.string   "mc_mx_ff_numbers"
    t.string   "duns_number"
    t.string   "power_units"
    t.string   "drivers"
    t.string   "mcs_150_form_date"
    t.string   "mcs_150_mileage_year"
    t.integer  "company_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                    default: "",    null: false
    t.string   "encrypted_password",       default: "",    null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "telephone"
    t.string   "extention"
    t.string   "cellphone"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "type"
    t.string   "emergency_contact"
    t.string   "emergency_contact_number"
    t.boolean  "company_admin",            default: false
    t.boolean  "admin",                    default: false
    t.boolean  "dispatcher",               default: false
    t.boolean  "office",                   default: false
    t.boolean  "maintenance",              default: false
    t.boolean  "shipping_receiving",       default: false
    t.boolean  "driver",                   default: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",          default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

end
