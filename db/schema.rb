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

ActiveRecord::Schema[7.0].define(version: 2022_09_05_181948) do
  create_table "documentos", force: :cascade do |t|
    t.string "rg"
    t.string "cpf"
    t.integer "pessoa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pessoa_id"], name: "index_documentos_on_pessoa_id"
  end

  create_table "esportes", force: :cascade do |t|
    t.string "nome_esporte"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "esportes_pessoas", force: :cascade do |t|
    t.integer "esporte_id"
    t.integer "pessoa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["esporte_id"], name: "index_esportes_pessoas_on_esporte_id"
    t.index ["pessoa_id"], name: "index_esportes_pessoas_on_pessoa_id"
  end

  create_table "estados", force: :cascade do |t|
    t.string "nome"
    t.string "sigla", limit: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pessoas", force: :cascade do |t|
    t.string "nome"
    t.string "sobrenome"
    t.integer "estado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estado_id"], name: "index_pessoas_on_estado_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "user_type", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "documentos", "pessoas"
  add_foreign_key "pessoas", "estados"
end
