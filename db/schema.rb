# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160515235714) do

  create_table "articulos", force: :cascade do |t|
    t.string   "descripcion",     limit: 255
    t.integer  "existencia",      limit: 4
    t.integer  "estados_id",      limit: 4
    t.integer  "departamento_id", limit: 4
    t.integer  "grupos_id",       limit: 4
    t.integer  "codigousuario",   limit: 4
    t.integer  "valor",           limit: 4
    t.string   "ubicacion",       limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "codigo",          limit: 4
    t.string   "estado",          limit: 255
  end

  add_index "articulos", ["codigo"], name: "codigo", using: :btree
  add_index "articulos", ["codigo"], name: "codigo_2", unique: true, using: :btree
  add_index "articulos", ["codigo"], name: "codigo_3", unique: true, using: :btree
  add_index "articulos", ["codigo"], name: "codigo_4", using: :btree
  add_index "articulos", ["departamento_id"], name: "index_articulos_on_departamento_id", using: :btree
  add_index "articulos", ["estados_id"], name: "index_articulos_on_estados_id", using: :btree
  add_index "articulos", ["grupos_id"], name: "index_articulos_on_grupos_id", using: :btree

  create_table "departamentos", force: :cascade do |t|
    t.string   "nombre",        limit: 255
    t.string   "titular",       limit: 255
    t.string   "clasificacion", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "enviarpedidos", force: :cascade do |t|
    t.integer  "solicitado",  limit: 4
    t.integer  "surtido",     limit: 4
    t.integer  "pedido_id",   limit: 4
    t.integer  "articulo_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "enviarsolicituds", force: :cascade do |t|
    t.integer  "solicitado",   limit: 4
    t.integer  "grupos_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "solicitud_id", limit: 4
    t.integer  "articulo_id",  limit: 4
  end

  add_index "enviarsolicituds", ["articulo_id"], name: "index_enviarsolicituds_on_articulo_id", using: :btree
  add_index "enviarsolicituds", ["grupos_id"], name: "index_enviarsolicituds_on_grupos_id", using: :btree
  add_index "enviarsolicituds", ["solicitud_id"], name: "index_enviarsolicituds_on_solicitud_id", using: :btree

  create_table "estados", force: :cascade do |t|
    t.string   "estado",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "grupos", force: :cascade do |t|
    t.integer  "codgrupo",    limit: 4
    t.integer  "codsubgrupo", limit: 4
    t.integer  "codseccion",  limit: 4
    t.string   "descripcion", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "grupos", ["codgrupo"], name: "codgrupo", using: :btree
  add_index "grupos", ["codseccion"], name: "codseccion", using: :btree
  add_index "grupos", ["codsubgrupo"], name: "codsubgrupo", using: :btree

  create_table "pedidos", force: :cascade do |t|
    t.integer  "codigo",          limit: 4
    t.integer  "departamento_id", limit: 4
    t.integer  "user_id",         limit: 4
    t.integer  "grupos_id",       limit: 4
    t.integer  "articulos_id",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "pedidos", ["articulos_id"], name: "index_pedidos_on_articulos_id", using: :btree
  add_index "pedidos", ["departamento_id"], name: "index_pedidos_on_departamento_id", using: :btree
  add_index "pedidos", ["grupos_id"], name: "index_pedidos_on_grupos_id", using: :btree
  add_index "pedidos", ["user_id"], name: "index_pedidos_on_user_id", using: :btree

  create_table "solicituds", force: :cascade do |t|
    t.integer  "nunsolicitud",    limit: 4
    t.integer  "grupos_id",       limit: 4
    t.integer  "departamento_id", limit: 4
    t.integer  "articulo_id",     limit: 4
    t.integer  "user_id",         limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "articulos_id",    limit: 4
  end

  add_index "solicituds", ["articulo_id"], name: "index_solicituds_on_articulo_id", using: :btree
  add_index "solicituds", ["articulos_id"], name: "index_solicituds_on_articulos_id", using: :btree
  add_index "solicituds", ["departamento_id"], name: "index_solicituds_on_departamento_id", using: :btree
  add_index "solicituds", ["grupos_id"], name: "index_solicituds_on_grupos_id", using: :btree
  add_index "solicituds", ["user_id"], name: "index_solicituds_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "nombre",                 limit: 255
    t.string   "apellidos",              limit: 255
    t.boolean  "admin",                              default: false
    t.string   "usuario",                limit: 255
    t.string   "role",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
