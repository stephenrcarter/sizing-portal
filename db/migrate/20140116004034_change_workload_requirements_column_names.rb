class ChangeWorkloadRequirementsColumnNames < ActiveRecord::Migration
  def change
    rename_column :workload_requirements, :cpu_cores, :num_vcpus
    rename_column :workload_requirements, :ram_mb, :memory_mb
  end
end
