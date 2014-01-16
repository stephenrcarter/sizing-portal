class CreateEnvironmentRequirements < ActiveRecord::Migration
  def change
    create_table :environment_requirements do |t|
      t.references :environment, index: true
      t.integer :cpu_cores
      t.float :cpu_cycles
      t.integer :ram_gb
      t.float :disk_capacity_gb
      t.float :ssd_capacity_gb

      t.timestamps
    end
  end
end
