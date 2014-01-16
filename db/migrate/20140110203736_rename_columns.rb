class RenameColumns < ActiveRecord::Migration
  def change
    rename_column :database_workloads, :memory_per_database_mb, :memory_per_database_vm_mb
    rename_column :database_workloads, :capacity_per_database_mb, :capacity_per_database_vm_mb
    rename_column :database_workloads, :working_set_per_database_mb, :capacity_per_database_vm_mb
  end
end
