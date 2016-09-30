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
    t.string   "broker_mc_number"
    t.string   "carrier_mc_number"
    t.string   "us_dot_number"
    t.string   "company_type"
    t.boolean  "show_add_mc",        default: true
    t.date     "date_formed"
    t.integer  "company_manager_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "mcs", force: :cascade do |t|
    t.string   "type",                                    default: "", null: false
    t.string   "entity_type",                             default: "", null: false
    t.string   "operating_status",                        default: "", null: false
    t.string   "out_of_service_date",                     default: "", null: false
    t.string   "legal_name",                              default: "", null: false
    t.string   "dba_name",                                default: "", null: false
    t.string   "physical_address",                        default: "", null: false
    t.string   "phone",                                   default: "", null: false
    t.string   "mailing_address",                         default: "", null: false
    t.string   "usdot_number",                            default: "", null: false
    t.string   "state_carrier_id_number",                 default: "", null: false
    t.string   "mc_mx_ff_numbers",                        default: "", null: false
    t.string   "duns_number",                             default: "", null: false
    t.string   "power_units",                             default: "", null: false
    t.string   "driver_count",                            default: "", null: false
    t.string   "mcs_150_form_date",                       default: "", null: false
    t.string   "mcs_150_mileage_year",                    default: "", null: false
    t.string   "general_freight",                         default: "", null: false
    t.string   "household_goods",                         default: "", null: false
    t.string   "metal_sheets_coils_rolls",                default: "", null: false
    t.string   "motor_vehicles",                          default: "", null: false
    t.string   "drivetow_away",                           default: "", null: false
    t.string   "logs_poles_beams_lumber",                 default: "", null: false
    t.string   "building_materials",                      default: "", null: false
    t.string   "mobile_homes",                            default: "", null: false
    t.string   "machinery_large_objects",                 default: "", null: false
    t.string   "fresh_produce",                           default: "", null: false
    t.string   "safer_layout",                            default: "", null: false
    t.string   "liquids_gases",                           default: "", null: false
    t.string   "intermodal",                              default: "", null: false
    t.string   "passengers",                              default: "", null: false
    t.string   "oilfield_equipment",                      default: "", null: false
    t.string   "livestock",                               default: "", null: false
    t.string   "grain_feed_hay",                          default: "", null: false
    t.string   "coal_coke",                               default: "", null: false
    t.string   "meat",                                    default: "", null: false
    t.string   "garbage_refuse",                          default: "", null: false
    t.string   "us_mail",                                 default: "", null: false
    t.string   "chemicals",                               default: "", null: false
    t.string   "commodities_dry_bulk",                    default: "", null: false
    t.string   "refrigerated_food",                       default: "", null: false
    t.string   "beverages",                               default: "", null: false
    t.string   "paper_products",                          default: "", null: false
    t.string   "utilities",                               default: "", null: false
    t.string   "agricultural_farm_supplies",              default: "", null: false
    t.string   "construction",                            default: "", null: false
    t.string   "water_well",                              default: "", null: false
    t.string   "driver_inspections_count",                default: "", null: false
    t.string   "vehicle_inspections_count",               default: "", null: false
    t.string   "hazmat_inspections_count",                default: "", null: false
    t.string   "iep_inspections_count",                   default: "", null: false
    t.string   "driver_inspections_out_service",          default: "", null: false
    t.string   "vehicle_inspections_out_service",         default: "", null: false
    t.string   "hazmat_inspections_out_service",          default: "", null: false
    t.string   "iep_inspections_out_service",             default: "", null: false
    t.string   "driver_inspections_out_service_percent",  default: "", null: false
    t.string   "vehicle_inspections_out_service_percent", default: "", null: false
    t.string   "hazmat_inspections_out_service_percent",  default: "", null: false
    t.string   "iep_inspections_out_service_percent",     default: "", null: false
    t.string   "crash_fatal",                             default: "", null: false
    t.string   "crash_injury",                            default: "", null: false
    t.string   "crash_tow",                               default: "", null: false
    t.string   "crash_total",                             default: "", null: false
    t.string   "cad_vehicle_inspections",                 default: "", null: false
    t.string   "cad_driver_inspections",                  default: "", null: false
    t.string   "cad_vehicle_out_of_service",              default: "", null: false
    t.string   "cad_driver_out_of_service",               default: "", null: false
    t.string   "cad_vehicle_out_of_service_percent",      default: "", null: false
    t.string   "cad_driver_out_of_service_percent",       default: "", null: false
    t.string   "us_inspections_prev_24",                  default: "", null: false
    t.string   "cad_inspections_prev_24",                 default: "", null: false
    t.integer  "company_id"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
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
