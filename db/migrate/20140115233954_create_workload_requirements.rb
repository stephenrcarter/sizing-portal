class CreateWorkloadRequirements < ActiveRecord::Migration
  def change
    create_table :workload_requirements do |t|
      t.references :workload, index: true
      t.integer :num_vms
      t.integer :cpu_cores
      t.integer :cpu_cycles_mhz
      t.integer :ram_mb
      t.integer :disk_capacity_mb
      t.integer :ssd_capacity_mb

      t.timestamps
    end
  end
end
