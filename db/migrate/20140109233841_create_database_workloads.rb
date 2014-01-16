class CreateDatabaseWorkloads < ActiveRecord::Migration
  def change
    create_table :database_workloads do |t|
      t.integer :num_database_vms
      t.integer :num_vcpus_per_database_vm
      t.integer :total_mhz_per_database
      t.integer :memory_per_database_mb
      t.integer :capacity_per_database_mb
      t.integer :working_set_per_database_mb
      t.integer :peak_iops_per_database

      t.timestamps
    end
  end
end
