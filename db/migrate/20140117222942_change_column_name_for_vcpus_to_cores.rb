class ChangeColumnNameForVcpusToCores < ActiveRecord::Migration
  def change
    rename_column :vdi_workloads, :vcpus_per_physical_core, :vcpus_per_core
  end
end
