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

ActiveRecord::Schema[7.0].define(version: 2022_12_05_210453) do
  create_table "admins", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "passcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_admins_on_user_id"
  end

  create_table "colleges", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "faculty"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "abbr"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.boolean "is_completed"
    t.string "title"
    t.string "start_date"
    t.string "end_date"
    t.string "venue"
    t.string "description"
    t.binary "image", size: :medium
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.binary "bgposter", size: :medium
  end

  create_table "members", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "department_id", null: false
    t.string "role"
    t.string "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_members_on_department_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "participants", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "player_name"
    t.bigint "user_id", null: false
    t.string "bio"
    t.binary "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "course"
    t.string "stream"
    t.string "year_of_passing"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "problem_statements", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.string "data"
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_problem_statements_on_team_id"
  end

  create_table "program_team_data", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "program_id", null: false
    t.string "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_program_team_data_on_program_id"
    t.index ["team_id"], name: "index_program_team_data_on_team_id"
  end

  create_table "programs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.boolean "is_open"
    t.string "title"
    t.string "description"
    t.string "datetime"
    t.integer "team_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.binary "image", size: :medium
    t.index ["event_id"], name: "index_programs_on_event_id"
  end

  create_table "team_participants", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "participant_id", null: false
    t.boolean "is_lead"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_team_participants_on_participant_id"
    t.index ["team_id"], name: "index_team_participants_on_team_id"
  end

  create_table "teams", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "program_id", null: false
    t.string "marks"
    t.string "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "college_id", null: false
    t.string "name"
    t.index ["college_id"], name: "index_teams_on_college_id"
    t.index ["program_id"], name: "index_teams_on_program_id"
  end

  create_table "user_details", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "firstname"
    t.string "lastname"
    t.string "dob"
    t.string "gender"
    t.string "phone1"
    t.string "phone2"
    t.string "email"
    t.binary "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_details_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "usertype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "admins", "users"
  add_foreign_key "members", "departments"
  add_foreign_key "members", "users"
  add_foreign_key "participants", "users"
  add_foreign_key "problem_statements", "teams"
  add_foreign_key "program_team_data", "programs"
  add_foreign_key "program_team_data", "teams"
  add_foreign_key "programs", "events"
  add_foreign_key "team_participants", "participants"
  add_foreign_key "team_participants", "teams"
  add_foreign_key "teams", "colleges"
  add_foreign_key "teams", "programs"
  add_foreign_key "user_details", "users"
end
