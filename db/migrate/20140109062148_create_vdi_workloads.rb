class CreateVdiWorkloads < ActiveRecord::Migration
  def change
    create_table :vdi_workloads do |t|
      t.references :workload, index: true
      t.integer :num_desktops
      t.integer :num_vcpus_per_desktop
      t.integer :mhz_per_desktop
      t.integer :memory_per_desktop_mb
      t.integer :capacity_per_desktop_mb
      t.integer :desktop_concurrency_percent
      t.integer :vcpus_per_physical_core
      t.integer :memory_overcommit_percent

      t.timestamps
    end
  end
end
