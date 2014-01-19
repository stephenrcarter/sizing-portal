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

ActiveRecord::Schema.define(version: 20140117222942) do

  create_table "database_workloads", force: true do |t|
    t.integer  "num_database_vms"
    t.integer  "num_vcpus_per_database_vm"
    t.integer  "mhz_per_database_vm"
    t.integer  "memory_per_database_vm_mb"
    t.integer  "capacity_per_database_vm_mb"
    t.integer  "peak_iops_per_database_vm"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "working_set_per_database_vm_mb"
    t.integer  "workload_id"
  end

  add_index "database_workloads", ["workload_id"], name: "index_database_workloads_on_workload_id"

  create_table "environment_requirements", force: true do |t|
    t.integer  "environment_id"
    t.integer  "cpu_cores"
    t.float    "cpu_cycles"
    t.integer  "ram_gb"
    t.float    "disk_capacity_gb"
    t.float    "ssd_capacity_gb"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "environment_requirements", ["environment_id"], name: "index_environment_requirements_on_environment_id"

  create_table "environments", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vdi_workloads", force: true do |t|
    t.integer  "workload_id"
    t.integer  "num_desktops"
    t.integer  "num_vcpus_per_desktop"
    t.integer  "mhz_per_desktop"
    t.integer  "memory_per_desktop_mb"
    t.integer  "capacity_per_desktop_mb"
    t.integer  "desktop_concurrency_percent"
    t.integer  "vcpus_per_core"
    t.integer  "memory_overcommit_percent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vdi_workloads", ["workload_id"], name: "index_vdi_workloads_on_workload_id"

  create_table "vdiworkloads", force: true do |t|
    t.integer  "workload_id"
    t.integer  "num_desktops"
    t.integer  "num_vcpus_per_desktop"
    t.integer  "mhz_per_desktop"
    t.integer  "memory_per_desktop_mb"
    t.integer  "capacity_per_desktop_mb"
    t.integer  "desktop_concurrency_percent"
    t.integer  "vcpus_per_physical_core"
    t.integer  "memory_overcommit_percent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vdiworkloads", ["workload_id"], name: "index_vdiworkloads_on_workload_id"

  create_table "workload_requirements", force: true do |t|
    t.integer  "workload_id"
    t.integer  "num_vms"
    t.integer  "num_cores"
    t.integer  "cpu_cycles_mhz"
    t.integer  "memory_mb"
    t.integer  "disk_capacity_mb"
    t.integer  "ssd_capacity_mb"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "workload_requirements", ["workload_id"], name: "index_workload_requirements_on_workload_id"

  create_table "workload_types", force: true do |t|
    t.string   "workload_type_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workloads", force: true do |t|
    t.string   "workload_name"
    t.integer  "environment_id"
    t.integer  "workload_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "workloads", ["environment_id"], name: "index_workloads_on_environment_id"
  add_index "workloads", ["workload_type_id"], name: "index_workloads_on_workload_type_id"

end
