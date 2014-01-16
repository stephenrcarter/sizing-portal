class RenameIopsColumn < ActiveRecord::Migration
  def change
    rename_column :database_workloads, :peak_iops_per_database, :peak_iops_per_database_vm
  end
end
