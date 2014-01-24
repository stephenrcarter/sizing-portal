class RenameRamGbToMemoryGb < ActiveRecord::Migration
  def change
    rename_column :environment_requirements, :ram_gb, :memory_mb
    rename_column :environment_requirements, :disk_capacity_gb, :disk_capacity_mb
    rename_column :environment_requirements, :ssd_capacity_gb, :ssd_capacity_mb
  end
end
