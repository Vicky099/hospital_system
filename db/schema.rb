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

ActiveRecord::Schema.define(version: 20180726085041) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "first_name"
    t.string "last_name"
    t.string "residence_address"
    t.string "city"
    t.string "state"
    t.string "education"
    t.string "specialist"
    t.string "gender"
    t.string "mobile_no"
    t.string "skills"
    t.string "thoughts"
    t.index ["email"], name: "index_doctors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_doctors_on_reset_password_token", unique: true
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
    t.string "registration_num"
    t.string "contact_num"
    t.string "no_of_beds"
    t.text "facilities"
    t.string "address"
    t.string "landmark"
    t.string "type_of_hospital"
    t.text "working_hours"
    t.bigint "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_hospitals_on_doctor_id"
  end

  create_table "medical_stores", force: :cascade do |t|
    t.bigint "hospital_id"
    t.string "owner"
    t.string "name"
    t.text "address"
    t.string "contact_no"
    t.string "status"
    t.string "gst_no"
    t.string "pancard_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hospital_id"], name: "index_medical_stores_on_hospital_id"
  end

  create_table "medicines", force: :cascade do |t|
    t.bigint "prescription_id"
    t.text "name"
    t.text "morning"
    t.text "morning_time"
    t.text "afternoon"
    t.text "afternoon_time"
    t.text "night"
    t.text "night_time"
    t.text "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prescription_id"], name: "index_medicines_on_prescription_id"
  end

  create_table "patients", force: :cascade do |t|
    t.bigint "doctor_id"
    t.bigint "hospital_id"
    t.string "first_name"
    t.string "last_name"
    t.text "address"
    t.string "contact_num"
    t.string "gender"
    t.string "date_of_birth"
    t.string "age"
    t.string "pulse"
    t.string "bp"
    t.text "gen_obs"
    t.text "major_obs"
    t.text "disease_found"
    t.text "appointment_status"
    t.text "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "charge"
    t.index ["doctor_id"], name: "index_patients_on_doctor_id"
    t.index ["hospital_id"], name: "index_patients_on_hospital_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "name"
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.bigint "patient_id"
    t.string "recheck_date"
    t.string "doctor_bill_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "prescription_num"
    t.string "no_of_days_medicine_taken"
    t.index ["patient_id"], name: "index_prescriptions_on_patient_id"
  end

end
