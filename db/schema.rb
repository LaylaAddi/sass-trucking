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

  create_table "address_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.integer  "address_category_id"
    t.string   "type"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "company"
    t.string   "contact"
    t.string   "phone"
    t.string   "notes"
    t.string   "pick_up_delivery"
    t.date     "pick_up_date"
    t.integer  "miles"
    t.integer  "load_id"
    t.integer  "trailer_id"
    t.integer  "truck_id"
    t.integer  "driver_checkin_id"
    t.integer  "driver_user_id"
    t.integer  "hrc_user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["address_category_id"], name: "index_addresses_on_address_category_id", using: :btree
    t.index ["driver_checkin_id"], name: "index_addresses_on_driver_checkin_id", using: :btree
    t.index ["driver_user_id"], name: "index_addresses_on_driver_user_id", using: :btree
    t.index ["hrc_user_id"], name: "index_addresses_on_hrc_user_id", using: :btree
    t.index ["load_id"], name: "index_addresses_on_load_id", using: :btree
    t.index ["trailer_id"], name: "index_addresses_on_trailer_id", using: :btree
    t.index ["truck_id"], name: "index_addresses_on_truck_id", using: :btree
  end

  create_table "app_variables", force: :cascade do |t|
    t.string   "app_name"
    t.string   "app_logo"
    t.string   "app_logo_name"
    t.string   "app_tab_name"
    t.string   "app_slogan"
    t.string   "app_favi"
    t.text     "app_terms"
    t.text     "app_conditions"
    t.string   "theme"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

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
    t.boolean  "has_multiple_pd",                  default: false
    t.string   "commodity"
    t.string   "weight"
    t.string   "units"
    t.string   "load_size"
    t.integer  "miles",                            default: 0
    t.decimal  "invoice_price"
    t.decimal  "booking_fee"
    t.decimal  "rate_told_to_driver"
    t.decimal  "percent_deducted"
    t.decimal  "total_hrc_expenses"
    t.decimal  "rate_to_driver"
    t.decimal  "rate_after_percent"
    t.decimal  "rate_after_booking_fee"
    t.decimal  "agent_fee",                        default: "0.0"
    t.date     "pick_up_date"
    t.time     "pick_up_time"
    t.string   "broker_shipper_load_id"
    t.string   "pick_up_notes"
    t.date     "delivery_date"
    t.time     "delivery_time"
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
    t.string   "shipper_company_name"
    t.string   "receiver_company_name"
    t.integer  "driver_statement_id"
    t.decimal  "rate_to_driver_after_factor_fees"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.index ["company_profile_id"], name: "index_loads_on_company_profile_id", using: :btree
    t.index ["driver_statement_id"], name: "index_loads_on_driver_statement_id", using: :btree
    t.index ["driver_user_id"], name: "index_loads_on_driver_user_id", using: :btree
    t.index ["hrc_user_id"], name: "index_loads_on_hrc_user_id", using: :btree
  end

  create_table "mcs", force: :cascade do |t|
    t.string   "type"
    t.string   "entity_type"
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
    t.string   "driver_count"
    t.string   "mcs_150_form_date"
    t.string   "mcs_150_mileage_year"
    t.string   "general_freight"
    t.string   "household_goods"
    t.string   "metal_sheets_coils_rolls"
    t.string   "motor_vehicles"
    t.string   "drivetow_away"
    t.string   "logs_poles_beams_lumber"
    t.string   "building_materials"
    t.string   "mobile_homes"
    t.string   "machinery_large_objects"
    t.string   "fresh_produce"
    t.string   "safer_layout"
    t.string   "liquids_gases"
    t.string   "intermodal"
    t.string   "passengers"
    t.string   "oilfield_equipment"
    t.string   "livestock"
    t.string   "grain_feed_hay"
    t.string   "coal_coke"
    t.string   "meat"
    t.string   "garbage_refuse"
    t.string   "us_mail"
    t.string   "chemicals"
    t.string   "commodities_dry_bulk"
    t.string   "refrigerated_food"
    t.string   "beverages"
    t.string   "paper_products"
    t.string   "utilities"
    t.string   "agricultural_farm_supplies"
    t.string   "construction"
    t.string   "water_well"
    t.string   "driver_inspections_count"
    t.string   "vehicle_inspections_count"
    t.string   "hazmat_inspections_count"
    t.string   "iep_inspections_count"
    t.string   "driver_inspections_out_service"
    t.string   "vehicle_inspections_out_service"
    t.string   "hazmat_inspections_out_service"
    t.string   "iep_inspections_out_service"
    t.string   "driver_inspections_out_service_percent"
    t.string   "vehicle_inspections_out_service_percent"
    t.string   "hazmat_inspections_out_service_percent"
    t.string   "iep_inspections_out_service_percent"
    t.string   "crash_fatal"
    t.string   "crash_injury"
    t.string   "crash_tow"
    t.string   "crash_total"
    t.string   "cad_vehicle_inspections"
    t.string   "cad_driver_inspections"
    t.string   "cad_vehicle_out_of_service"
    t.string   "cad_driver_out_of_service"
    t.string   "cad_vehicle_out_of_service_percent"
    t.string   "cad_driver_out_of_service_percent"
    t.string   "us_inspections_prev_24"
    t.string   "cad_inspections_prev_24"
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
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.index ["company_profile_id"], name: "index_mcs_on_company_profile_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.string   "number"
    t.string   "text"
    t.boolean  "inbound"
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
    t.integer  "hrc_user_id"
    t.integer  "driver_user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["driver_user_id"], name: "index_messages_on_driver_user_id", using: :btree
    t.index ["hrc_user_id"], name: "index_messages_on_hrc_user_id", using: :btree
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
    t.string   "length"
    t.string   "door_type"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "plate"
    t.string   "plate_state"
    t.integer  "driver_user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
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
    t.string   "plate"
    t.string   "plate_state"
    t.integer  "driver_user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
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
    t.boolean  "app_agree_terms"
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
