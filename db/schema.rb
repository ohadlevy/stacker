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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110901123220) do

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "deployments", :force => true do |t|
    t.integer  "stack_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instances", :force => true do |t|
    t.integer  "resource_id"
    t.integer  "deployment_id"
    t.string   "uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keys", :force => true do |t|
    t.string   "key"
    t.integer  "resource_id"
    t.integer  "external_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "external_resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stack_keys", :force => true do |t|
    t.integer  "stack_id"
    t.integer  "key_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stack_resources", :force => true do |t|
    t.integer  "stack_id"
    t.integer  "resource_id"
    t.integer  "deployment_id"
    t.integer  "quantity",      :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stacks", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
