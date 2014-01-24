class AddIopsColumns < ActiveRecord::Migration
  def change
    add_column :environment_requirements, :peak_iops, :integer
    add_column :vdi_workloads, :peak_iops_per_desktop, :integer
    add_column :workload_requirements, :peak_iops, :integer
  end
end
