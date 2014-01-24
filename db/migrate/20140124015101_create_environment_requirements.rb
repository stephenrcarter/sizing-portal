class CreateEnvironmentRequirements < ActiveRecord::Migration
  def change
    create_table :environment_requirements do |t|
      t.references :environment, index: true
      t.integer :cpu_cores
      t.integer :cpu_cycles_mhz
      t.integer :memory_mb
      t.integer :disk_capacity_mb
      t.integer :ssd_capacity_mb
      t.integer :peak_iops

      t.timestamps
    end
  end
end
