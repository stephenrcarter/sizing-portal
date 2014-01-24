class AddMhzToCpuCyclesColumnOnEnvironmentRequirements < ActiveRecord::Migration
  def change
    rename_column :environment_requirements, :cpu_cycles, :cpu_cycles_mhz
  end
end
