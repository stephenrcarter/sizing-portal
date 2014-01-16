class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :database_workloads, :total_mhz_per_database, :total_mhz_per_database_vm
  end
end
