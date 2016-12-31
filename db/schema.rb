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

ActiveRecord::Schema.define(version: 20161231073843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "company_profile_memberships", force: :cascade do |t|
    t.integer  "company_profile_id"
    t.integer  "user_id"
    t.string   "membership_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["company_profile_id"], name: "index_company_profile_memberships_on_company_profile_id", using: :btree
    t.index ["user_id", "company_profile_id"], name: "user_company_profile", using: :btree
    t.index ["user_id"], name: "index_company_profile_memberships_on_user_id", using: :btree
  end

  create_table "company_profiles", force: :cascade do |t|
    t.string   "company_name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "telephone"
    t.string   "fax"
    t.string   "website"
    t.string   "logo"
    t.string   "broker_mc_number"
    t.string   "carrier_mc_number"
    t.string   "us_dot_number"
    t.string   "updated_by"
    t.string   "contact"
    t.string   "email"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "driver_checkins", force: :cascade do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "status"
    t.string   "notes"
    t.string   "ip_address"
    t.integer  "driver_user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["driver_user_id"], name: "index_driver_checkins_on_driver_user_id", using: :btree
  end

  create_table "driver_statements", force: :cascade do |t|
    t.string   "notes"
    t.integer  "driver_user_id"
    t.string   "payment_status"
    t.date     "due_date"
    t.decimal  "insurance_payment", default: "0.0"
    t.decimal  "trailer_rental",    default: "0.0"
    t.decimal  "truck_rental",      default: "0.0"
    t.decimal  "other",             default: "0.0"
    t.string   "payment_notes"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "load_addresses", force: :cascade do |t|
    t.string   "address_type"
    t.string   "street"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "company"
    t.string   "contact"
    t.string   "phone"
    t.string   "notes"
    t.integer  "load_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["load_id"], name: "index_load_addresses_on_load_id", using: :btree
  end

  create_table "load_documents", force: :cascade do |t|
    t.string   "doc_file"
    t.string   "file_type"
    t.string   "note"
    t.integer  "load_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["load_id"], name: "index_load_documents_on_load_id", using: :btree
  end

  create_table "loads", force: :cascade do |t|
    t.string   "commodity"
    t.string   "weight"
    t.string   "units"
    t.string   "load_size"
    t.integer  "miles"
    t.decimal  "invoice_price"
    t.decimal  "booking_fee"
    t.decimal  "rate_told_to_driver"
    t.decimal  "percent_deducted"
    t.decimal  "total_hrc_expenses"
    t.decimal  "rate_to_driver"
    t.decimal  "rate_after_percent"
    t.decimal  "rate_after_booking_fee"
    t.date     "pick_up_date"
    t.time     "pick_up_time"
    t.string   "pick_up_time_notes"
    t.string   "pick_up_notes"
    t.date     "delivery_date"
    t.time     "delivery_time"
    t.string   "delivery_time_notes"
    t.string   "delivery_notes"
    t.string   "equipment_type"
    t.string   "status_name"
    t.integer  "hrc_user_id"
    t.integer  "driver_user_id"
    t.integer  "company_profile_id"
    t.string   "updated_by"
    t.string   "special_instructions"
    t.string   "dimentions"
    t.string   "origin_street"
    t.string   "origin_city"
    t.string   "origin_state"
    t.string   "origin_zip"
    t.string   "origin_phone"
    t.string   "origin_contact"
    t.float    "origin_latitude"
    t.float    "origin_longitude"
    t.string   "destination_street"
    t.string   "destination_city"
    t.string   "destination_state"
    t.string   "destination_zip"
    t.string   "destination_phone"
    t.string   "destination_contact"
    t.float    "destination_latitude"
    t.float    "destination_longitude"
    t.string   "consignor_name"
    t.string   "consignee_name"
    t.integer  "driver_statement_id"
    t.decimal  "rate_to_driver_after_factor_fees"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["company_profile_id"], name: "index_loads_on_company_profile_id", using: :btree
    t.index ["driver_statement_id"], name: "index_loads_on_driver_statement_id", using: :btree
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
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.integer  "company_profile_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "number"
    t.string   "text"
    t.boolean  "inbound"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "user"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "to_country"
    t.string   "to_state"
    t.string   "to_city"
    t.string   "to_zip"
    t.string   "from_country"
    t.string   "from_state"
    t.string   "from_city"
    t.string   "from_zip"
    t.string   "sms_message_sid"
    t.string   "num_media"
    t.string   "sms_sid"
  end

  create_table "miles", force: :cascade do |t|
    t.integer  "mileage"
    t.string   "type"
    t.string   "notes"
    t.integer  "trailer_id"
    t.integer  "truck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trailer_id"], name: "index_miles_on_trailer_id", using: :btree
    t.index ["truck_id"], name: "index_miles_on_truck_id", using: :btree
  end

  create_table "trailer_images", force: :cascade do |t|
    t.string   "notes"
    t.string   "image_file"
    t.integer  "trailer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trailer_id"], name: "index_trailer_images_on_trailer_id", using: :btree
  end

  create_table "trailers", force: :cascade do |t|
    t.string   "year"
    t.string   "make"
    t.string   "model"
    t.string   "color"
    t.string   "number"
    t.string   "service_status"
    t.string   "vin"
    t.string   "image"
    t.string   "notes"
    t.integer  "driver_user_id"
    t.string   "length"
    t.string   "door_type"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "plate"
    t.string   "plate_state"
    t.index ["driver_user_id"], name: "index_trailers_on_driver_user_id", using: :btree
  end

  create_table "transactions", force: :cascade do |t|
    t.string   "expense_type"
    t.decimal  "debit",                default: "0.0"
    t.decimal  "credit",               default: "0.0"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "transactionable_id"
    t.string   "transactionable_type"
    t.string   "business_name"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "truck_images", force: :cascade do |t|
    t.string   "notes"
    t.string   "image_file"
    t.integer  "truck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["truck_id"], name: "index_truck_images_on_truck_id", using: :btree
  end

  create_table "trucks", force: :cascade do |t|
    t.boolean  "belongs_to_hrc", default: false
    t.string   "year"
    t.string   "make"
    t.string   "model"
    t.string   "color"
    t.string   "number"
    t.string   "vin"
    t.string   "image"
    t.string   "notes"
    t.string   "service_status"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "driver_user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "plate"
    t.string   "plate_state"
    t.index ["driver_user_id"], name: "index_trucks_on_driver_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                    default: "",           null: false
    t.string   "encrypted_password",       default: "",           null: false
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
    t.string   "profile_bg"
    t.string   "profile_image"
    t.boolean  "company_profile_admin",    default: false
    t.boolean  "admin",                    default: false
    t.boolean  "dispatcher",               default: false
    t.boolean  "office",                   default: false
    t.boolean  "maintenance",              default: false
    t.boolean  "company_driver",           default: false
    t.boolean  "owner_operator",           default: false
    t.boolean  "shipping_receiving",       default: false
    t.decimal  "driver_rpm",               default: "0.0"
    t.string   "employment_status",        default: "not_active"
    t.string   "time_zone"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,            null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",          default: 0,            null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

  create_table "vendor_profiles", force: :cascade do |t|
    t.string   "company_name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "telephone"
    t.string   "fax"
    t.string   "website"
    t.string   "logo"
    t.string   "contact_name"
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
