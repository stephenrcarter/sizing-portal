class AddWorkloadReference < ActiveRecord::Migration
  def change
    add_reference :database_workloads, :workload, index: true
  end
end
