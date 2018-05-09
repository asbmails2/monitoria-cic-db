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

ActiveRecord::Schema.define(version: 0) do

  create_table "admins", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", null: false, collation: "utf8_general_ci"
    t.string "email", null: false, collation: "utf8_general_ci"
    t.string "password", null: false, collation: "utf8_general_ci"
    t.string "remember_token", limit: 100, collation: "utf8_general_ci"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["email"], name: "admins_email_unique", unique: true
  end

  create_table "bolsas", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "quantidade"
    t.timestamp "created_at"
  end

  create_table "dados_bancarios", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "codigo", limit: 11, null: false
    t.string "agencia", limit: 11, null: false
    t.string "conta_corrente", limit: 11, null: false
  end

  create_table "descricao_periodo", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "descricao", limit: 45
  end

  create_table "disciplinas", primary_key: "cod_disciplina", id: :integer, unsigned: true, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "nome", null: false, collation: "utf8_general_ci"
    t.integer "fk_tipo_disciplina_id", default: 2, null: false
    t.integer "c_prat", default: 0, null: false
    t.integer "c_teor", default: 0, null: false
    t.integer "c_est", default: 0, null: false
    t.integer "c_ext", default: 0, null: false
    t.index ["cod_disciplina"], name: "disciplinas_cod_disciplina_index"
    t.index ["fk_tipo_disciplina_id"], name: "fk_disciplinas_tipo_disciplina1_idx"
  end

  create_table "migrations", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "migration", null: false, collation: "utf8_general_ci"
    t.integer "batch", null: false
  end

  create_table "monitoria", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "remuneracao", limit: 45, null: false
    t.string "fk_matricula", limit: 11, null: false, collation: "utf8_general_ci"
    t.integer "fk_cod_disciplina", null: false, unsigned: true
    t.integer "fk_turmas_id", null: false
    t.text "descricao_status"
    t.integer "prioridade"
    t.integer "fk_status_monitoria_id", null: false
    t.index ["fk_cod_disciplina"], name: "fk_monitoria_disciplinas1_idx"
    t.index ["fk_matricula"], name: "fk_matricula_UNIQUE"
    t.index ["fk_matricula"], name: "fk_monitoria_users_idx"
    t.index ["fk_status_monitoria_id"], name: "fk_monitoria_status_monitoria1_idx"
    t.index ["fk_turmas_id"], name: "fk_monitoria_turmas1_idx"
  end

  create_table "password_resets", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "email", null: false, collation: "utf8_general_ci"
    t.string "token", null: false, collation: "utf8_general_ci"
    t.timestamp "created_at"
    t.index ["email"], name: "password_resets_email_index"
    t.index ["token"], name: "password_resets_token_index"
  end

  create_table "periodos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.timestamp "inicio"
    t.timestamp "fim"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer "fk_id_descricao", null: false
    t.index ["fk_id_descricao"], name: "fk_periodos_descricao_periodo1_idx"
  end

  create_table "professors", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", null: false, collation: "utf8_general_ci"
    t.string "username", null: false, collation: "utf8_general_ci"
    t.string "email", null: false, collation: "utf8_general_ci"
    t.string "password", null: false, collation: "utf8_general_ci"
    t.integer "role", null: false
    t.string "remember_token", limit: 100, collation: "utf8_general_ci"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["username"], name: "professors_username_unique", unique: true
  end

  create_table "status_monitoria", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nome", limit: 45
  end

  create_table "status_turma", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nome", limit: 45
  end

  create_table "tipo_disciplina", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "tipo", limit: 45
  end

  create_table "turmas", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "turma", null: false, collation: "utf8_general_ci"
    t.string "professor", null: false, collation: "utf8_general_ci"
    t.integer "fk_cod_disciplina", null: false, unsigned: true
    t.integer "fk_status_turma_id", default: 3, null: false
    t.integer "qnt_bolsas", default: 0, null: false
    t.integer "fk_vagas_id", null: false
    t.index ["fk_cod_disciplina"], name: "fk_turmas_disciplinas1_idx"
    t.index ["fk_status_turma_id"], name: "fk_turmas_status_turma1_idx"
    t.index ["fk_vagas_id"], name: "fk_turmas_vagas1_idx"
  end

  create_table "users", primary_key: ["id", "matricula"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "id", null: false, unsigned: true, auto_increment: true
    t.string "name", null: false, collation: "utf8_general_ci"
    t.string "email", null: false, collation: "utf8_general_ci"
    t.string "password", null: false, collation: "utf8_general_ci"
    t.string "cpf", limit: 11, null: false, collation: "utf8_general_ci"
    t.string "rg", limit: 11, null: false, collation: "utf8_general_ci"
    t.string "matricula", limit: 11, null: false, collation: "utf8_general_ci"
    t.integer "fk_banco"
    t.string "remember_token", limit: 100, collation: "utf8_general_ci"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["cpf"], name: "users_cpf_unique", unique: true
    t.index ["email"], name: "users_email_unique", unique: true
    t.index ["fk_banco"], name: "fk_banco"
    t.index ["matricula"], name: "users_matricula_unique", unique: true
    t.index ["rg"], name: "users_rg_unique", unique: true
  end

  create_table "vagas", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "t_total", default: 0, null: false
    t.integer "t_ocupadas", default: 0, null: false
    t.integer "t_restantes", default: 0, null: false
    t.integer "c_total", default: 0, null: false
    t.integer "c_ocupadas", default: 0, null: false
    t.integer "c_restantes", default: 0, null: false
  end

  add_foreign_key "disciplinas", "tipo_disciplina", column: "fk_tipo_disciplina_id", name: "fk_disciplinas_tipo_disciplina1"
  add_foreign_key "monitoria", "disciplinas", column: "fk_cod_disciplina", primary_key: "cod_disciplina", name: "fk_monitoria_disciplinas1"
  add_foreign_key "monitoria", "status_monitoria", column: "fk_status_monitoria_id", name: "fk_monitoria_status_monitoria1"
  add_foreign_key "monitoria", "turmas", column: "fk_turmas_id", name: "fk_monitoria_turmas1"
  add_foreign_key "monitoria", "users", column: "fk_matricula", primary_key: "matricula", name: "fk_monitoria_users"
  add_foreign_key "periodos", "descricao_periodo", column: "fk_id_descricao", name: "fk_periodos_descricao_periodo1"
  add_foreign_key "turmas", "disciplinas", column: "fk_cod_disciplina", primary_key: "cod_disciplina", name: "fk_turmas_disciplinas1"
  add_foreign_key "turmas", "status_turma", column: "fk_status_turma_id", name: "fk_turmas_status_turma1"
  add_foreign_key "turmas", "vagas", column: "fk_vagas_id", name: "fk_turmas_vagas1"
  add_foreign_key "users", "dados_bancarios", column: "fk_banco", name: "users_ibfk_1"
end
