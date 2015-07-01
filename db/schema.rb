ActiveRecord::Schema.define(version: 20150630162430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "paintings", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.float    "price"
    t.string   "genre"
    t.string   "painter"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
