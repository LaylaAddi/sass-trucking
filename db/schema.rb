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

ActiveRecord::Schema.define(version: 20161002155212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address_type"
    t.string "street"
    t.string "street2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "notes"
    t.string "load_id"
  end

  create_table "company_profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "telephone"
    t.string   "website"
    t.string   "logo"
    t.string   "broker_mc_number"
    t.string   "carrier_mc_number"
    t.string   "us_dot_number"
    t.string   "updated_by"
    t.string   "contact"
    t.string   "profile_image"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "loads", force: :cascade do |t|
    t.string   "name"
    t.string   "commodity"
    t.string   "weight"
    t.string   "units"
    t.string   "load_size"
    t.decimal  "rate"
    t.integer  "distance"
    t.datetime "pick_up_time"
    t.string   "pick_up_notes"
    t.datetime "delevery_time"
    t.string   "delevery_notes"
    t.string   "equipment_type"
    t.string   "status_name"
    t.integer  "hrc_user_id"
    t.integer  "driver_user_id"
    t.string   "updated_by"
    t.string   "special_instructions"
    t.string   "dimentions"
    t.string   "origin_street"
    t.string   "origin_street2"
    t.string   "origin_city"
    t.string   "origin_state"
    t.string   "origin_zip"
    t.string   "origin_phone"
    t.string   "origin_contact"
    t.float    "origin_latitude"
    t.float    "origin_longitude"
    t.string   "destination_street"
    t.string   "destination_street2"
    t.string   "destination_city"
    t.string   "destination_state"
    t.string   "destination_zip"
    t.string   "destination_phone"
    t.string   "destination_contact"
    t.float    "destination_latitude"
    t.float    "destination_longitude"
    t.string   "consignor_name"
    t.string   "consignee_name"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["driver_user_id"], name: "index_loads_on_driver_user_id", using: :btree
    t.index ["hrc_user_id"], name: "index_loads_on_hrc_user_id", using: :btree
  end

  create_table "mcs", force: :cascade do |t|
    t.string   "type",                                         default: "", null: false
    t.string   "entity_type",                                  default: "", null: false
    t.string   "operating_status",                             default: "", null: false
    t.string   "out_of_service_date",                          default: "", null: false
    t.string   "legal_name",                                   default: "", null: false
    t.string   "dba_name",                                     default: "", null: false
    t.string   "physical_address",                             default: "", null: false
    t.string   "phone",                                        default: "", null: false
    t.string   "mailing_address",                              default: "", null: false
    t.string   "usdot_number",                                 default: "", null: false
    t.string   "state_carrier_id_number",                      default: "", null: false
    t.string   "mc_mx_ff_numbers",                             default: "", null: false
    t.string   "duns_number",                                  default: "", null: false
    t.string   "power_units",                                  default: "", null: false
    t.string   "driver_count",                                 default: "", null: false
    t.string   "mcs_150_form_date",                            default: "", null: false
    t.string   "mcs_150_mileage_year",                         default: "", null: false
    t.string   "general_freight",                              default: "", null: false
    t.string   "household_goods",                              default: "", null: false
    t.string   "metal_sheets_coils_rolls",                     default: "", null: false
    t.string   "motor_vehicles",                               default: "", null: false
    t.string   "drivetow_away",                                default: "", null: false
    t.string   "logs_poles_beams_lumber",                      default: "", null: false
    t.string   "building_materials",                           default: "", null: false
    t.string   "mobile_homes",                                 default: "", null: false
    t.string   "machinery_large_objects",                      default: "", null: false
    t.string   "fresh_produce",                                default: "", null: false
    t.string   "safer_layout",                                 default: "", null: false
    t.string   "liquids_gases",                                default: "", null: false
    t.string   "intermodal",                                   default: "", null: false
    t.string   "passengers",                                   default: "", null: false
    t.string   "oilfield_equipment",                           default: "", null: false
    t.string   "livestock",                                    default: "", null: false
    t.string   "grain_feed_hay",                               default: "", null: false
    t.string   "coal_coke",                                    default: "", null: false
    t.string   "meat",                                         default: "", null: false
    t.string   "garbage_refuse",                               default: "", null: false
    t.string   "us_mail",                                      default: "", null: false
    t.string   "chemicals",                                    default: "", null: false
    t.string   "commodities_dry_bulk",                         default: "", null: false
    t.string   "refrigerated_food",                            default: "", null: false
    t.string   "beverages",                                    default: "", null: false
    t.string   "paper_products",                               default: "", null: false
    t.string   "utilities",                                    default: "", null: false
    t.string   "agricultural_farm_supplies",                   default: "", null: false
    t.string   "construction",                                 default: "", null: false
    t.string   "water_well",                                   default: "", null: false
    t.string   "driver_inspections_count",                     default: "", null: false
    t.string   "vehicle_inspections_count",                    default: "", null: false
    t.string   "hazmat_inspections_count",                     default: "", null: false
    t.string   "iep_inspections_count",                        default: "", null: false
    t.string   "driver_inspections_out_service",               default: "", null: false
    t.string   "vehicle_inspections_out_service",              default: "", null: false
    t.string   "hazmat_inspections_out_service",               default: "", null: false
    t.string   "iep_inspections_out_service",                  default: "", null: false
    t.string   "driver_inspections_out_service_percent",       default: "", null: false
    t.string   "vehicle_inspections_out_service_percent",      default: "", null: false
    t.string   "hazmat_inspections_out_service_percent",       default: "", null: false
    t.string   "iep_inspections_out_service_percent",          default: "", null: false
    t.string   "crash_fatal",                                  default: "", null: false
    t.string   "crash_injury",                                 default: "", null: false
    t.string   "crash_tow",                                    default: "", null: false
    t.string   "crash_total",                                  default: "", null: false
    t.string   "cad_vehicle_inspections",                      default: "", null: false
    t.string   "cad_driver_inspections",                       default: "", null: false
    t.string   "cad_vehicle_out_of_service",                   default: "", null: false
    t.string   "cad_driver_out_of_service",                    default: "", null: false
    t.string   "cad_vehicle_out_of_service_percent",           default: "", null: false
    t.string   "cad_driver_out_of_service_percent",            default: "", null: false
    t.string   "us_inspections_prev_24",                       default: "", null: false
    t.string   "cad_inspections_prev_24",                      default: "", null: false
    t.string   "crash_results_24_prior"
    t.string   "cad_crash_results_24_prior"
    t.string   "cad_crash_fatal"
    t.string   "cad_crash_injury"
    t.string   "cad_crash_tow"
    t.string   "cad_crash_total"
    t.string   "us_inspection_results_for_24_months_prior_to"
    t.string   "total_inspections"
    t.string   "total_iep_inspections"
    t.string   "crash_inspections"
    t.string   "the_rating_below_is_current_as_of"
    t.string   "rating_date"
    t.string   "review_date"
    t.string   "review_rating"
    t.string   "review_type"
    t.string   "company_profile_id"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                    default: "",        null: false
    t.string   "encrypted_password",       default: "",        null: false
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
    t.string   "image"
    t.string   "profile_image"
    t.boolean  "company_profile_admin",    default: false
    t.boolean  "admin",                    default: false
    t.boolean  "dispatcher",               default: false
    t.boolean  "office",                   default: false
    t.boolean  "maintenance",              default: false
    t.boolean  "shipping_receiving",       default: false
    t.string   "employment_status",        default: "pending"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",          default: 0,         null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

end
