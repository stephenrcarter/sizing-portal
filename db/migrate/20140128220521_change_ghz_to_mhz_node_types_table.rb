class ChangeGhzToMhzNodeTypesTable < ActiveRecord::Migration
  def change
    rename_column :node_types, :cpu_clock_speed_ghz, :cpu_clock_speed_mhz
  end
end
