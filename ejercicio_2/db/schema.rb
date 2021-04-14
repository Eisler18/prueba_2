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

ActiveRecord::Schema.define(version: 2021_04_13_220657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", primary_key: "identificacion", id: :integer, default: nil, force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "tipo", limit: 10, null: false
    t.date "emision_id", null: false
    t.date "venc_id", null: false
    t.string "nombre", limit: 30, null: false
    t.string "correo", limit: 50, null: false
    t.string "tlf_prin", limit: 15, null: false
    t.string "tlf_sec", limit: 15
    t.check_constraint "((tipo)::text = 'Natural'::text) OR ((tipo)::text = 'Juridica'::text)", name: "users_tipo_check"
  end

end
