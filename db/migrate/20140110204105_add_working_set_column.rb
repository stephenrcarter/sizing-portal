class AddWorkingSetColumn < ActiveRecord::Migration
  def change
    add_column :database_workloads, :working_set_per_database_vm_mb, :integer
  end
end
