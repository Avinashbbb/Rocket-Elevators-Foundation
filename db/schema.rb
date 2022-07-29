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

ActiveRecord::Schema.define(version: 2022_07_27_040437) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "address_type", null: false
    t.string "status", null: false
    t.string "entity", null: false
    t.string "numberAndStreet", null: false
    t.string "suiteOrApartment", null: false
    t.string "city", null: false
    t.string "postal_code", null: false
    t.string "country", null: false
    t.string "notes", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.bigint "building_id"
    t.index ["building_id"], name: "index_addresses_on_building_id"
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
  end

  create_table "batteries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "types", null: false
    t.string "status", null: false
    t.integer "EmployeeId", null: false
    t.datetime "date_commissioning", null: false
    t.datetime "date_last_inspection", null: false
    t.string "certificate_of_operations", null: false
    t.string "information", null: false
    t.string "notes", null: false
    t.bigint "building_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_batteries_on_building_id"
  end

  create_table "building_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "InformationKey"
    t.text "Value"
    t.bigint "building_id"
    t.index ["building_id"], name: "index_building_details_on_building_id"
  end

  create_table "building_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "number_apartments"
    t.integer "number_floors"
    t.integer "number_elevators"
    t.integer "number_occupants"
    t.string "companyName"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "addressOfBuilding"
    t.string "full_name_building_admin", null: false
    t.string "email_building_admin", null: false
    t.string "phone_building_admin", null: false
    t.string "full_name_technical_authority", null: false
    t.string "email_technical_authority", null: false
    t.string "phone_technical_authority", null: false
    t.string "interventionDateStart"
    t.string "interventionDateEnd"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_buildings_on_customer_id"
  end

  create_table "cache_memories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "selectedCustomer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "columns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "types", null: false
    t.string "model"
    t.string "numberFloorServed", null: false
    t.string "status", null: false
    t.string "information", null: false
    t.string "notes", null: false
    t.bigint "batterie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batterie_id"], name: "index_columns_on_batterie_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "dateCreation"
    t.string "companyName", null: false
    t.string "fullName", null: false
    t.string "contactPhone", null: false
    t.string "email", null: false
    t.string "description", null: false
    t.string "companyHqAddresse"
    t.string "fullNameTechnicalAuthority"
    t.string "technicalAuthorityPhone"
    t.string "technicalAuthorityEmail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "elevators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "serial_number", null: false
    t.string "companyName", null: false
    t.string "model", null: false
    t.string "fullName", null: false
    t.string "email", null: false
    t.string "types", null: false
    t.string "status", null: false
    t.datetime "dateCommissioning", null: false
    t.datetime "dateLastInspection", null: false
    t.string "certificateOperations", null: false
    t.string "information", null: false
    t.string "notes", null: false
    t.bigint "column_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["column_id"], name: "index_elevators_on_column_id"
  end

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "firstNname", null: false
    t.string "lastName", null: false
    t.string "title", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "google_maps_customers_locations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "location_building"
    t.integer "building_floors"
    t.string "client_name"
    t.integer "nb_battries"
    t.integer "nb_columns"
    t.integer "nb_elevators"
    t.string "tech_contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interventions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "author"
    t.string "interventionDateStart"
    t.string "interventionDateEnd"
    t.string "result"
    t.string "report"
    t.string "status"
    t.bigint "customer_id"
    t.bigint "employee_id"
    t.bigint "building_id"
    t.bigint "batterie_id"
    t.bigint "column_id"
    t.bigint "elevator_id"
    t.index ["batterie_id"], name: "index_interventions_on_batterie_id"
    t.index ["building_id"], name: "index_interventions_on_building_id"
    t.index ["column_id"], name: "index_interventions_on_column_id"
    t.index ["customer_id"], name: "index_interventions_on_customer_id"
    t.index ["elevator_id"], name: "index_interventions_on_elevator_id"
    t.index ["employee_id"], name: "index_interventions_on_employee_id"
  end

  create_table "leads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "fullNameContact"
    t.string "companyName"
    t.string "email"
    t.string "phoneNumber"
    t.string "nameProject"
    t.string "descriptionProject"
    t.string "department"
    t.string "message"
    t.binary "file"
    t.datetime "date"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_leads_on_customer_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type_building", null: false
    t.integer "numApartment"
    t.integer "numFloor"
    t.integer "numElevator"
    t.integer "numOccupant"
    t.string "companyName"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_quotes_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "emp", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
