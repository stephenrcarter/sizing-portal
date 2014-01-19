class ChangeNumVcpusToNumCores < ActiveRecord::Migration
  def change
    rename_column :workload_requirements, :num_vcpus, :num_cores
  end
end
