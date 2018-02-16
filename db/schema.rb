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

ActiveRecord::Schema.define(version: 20171123032050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alumnos", force: :cascade do |t|
    t.integer "cant_horas"
    t.bigint "carrera_id"
    t.bigint "datos_personal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrera_id"], name: "index_alumnos_on_carrera_id"
    t.index ["datos_personal_id"], name: "index_alumnos_on_datos_personal_id"
  end

  create_table "attacheds", force: :cascade do |t|
    t.string "descripcion"
    t.date "fecha_subida"
    t.bigint "investigation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.datetime "file_updated_at"
    t.index ["investigation_id"], name: "index_attacheds_on_investigation_id"
  end

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_id", "associated_type"], name: "associated_index"
    t.index ["auditable_id", "auditable_type"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "careers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carreras", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_users", force: :cascade do |t|
    t.string "nombre"
    t.string "apeelido"
    t.string "telefono"
    t.string "direccion"
    t.string "correo"
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_data_users_on_users_id"
  end

  create_table "datos_personals", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "telefono"
    t.string "direccion"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_datos_personals_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.bigint "extension_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "doc_file_name"
    t.string "doc_content_type"
    t.integer "doc_file_size"
    t.datetime "doc_updated_at"
    t.index ["extension_id"], name: "index_documents_on_extension_id"
  end

  create_table "extension_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "extensions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.date "date_start"
    t.date "date_end"
    t.bigint "state_id"
    t.bigint "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "extension_type_id"
    t.index ["extension_type_id"], name: "index_extensions_on_extension_type_id"
    t.index ["manager_id"], name: "index_extensions_on_manager_id"
    t.index ["state_id"], name: "index_extensions_on_state_id"
  end

  create_table "homes", force: :cascade do |t|
    t.string "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

   create_table "investigations", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.date "fecha_inicio"
    t.date "fecha_fin"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_investigations_on_user_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "place"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "extension_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "img_file_name"
    t.string "img_content_type"
    t.integer "img_file_size"
    t.datetime "img_updated_at"
    t.index ["extension_id"], name: "index_photos_on_extension_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "email"
    t.string "ci"
    t.string "hours"
    t.bigint "career_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["career_id"], name: "index_students_on_career_id"
  end

  create_table "universitarios", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.integer "ci"
    t.string "correo"
    t.integer "cant_horas"
    t.bigint "carrera_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrera_id"], name: "index_universitarios_on_carrera_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.string "name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "alumnos", "carreras"
  add_foreign_key "alumnos", "datos_personals"
  add_foreign_key "attacheds", "investigations"
  add_foreign_key "data_users", "users", column: "users_id"
  add_foreign_key "datos_personals", "users"
  add_foreign_key "documents", "extensions"
  add_foreign_key "extensions", "extension_types"
  add_foreign_key "extensions", "managers"
  add_foreign_key "extensions", "states"
  add_foreign_key "investigations", "users"
  add_foreign_key "photos", "extensions"
  add_foreign_key "students", "careers"
  add_foreign_key "universitarios", "carreras"
end
