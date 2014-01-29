class ChangeCpuClockSpeedMhzTypeNodeTypesTable < ActiveRecord::Migration
  def change
    change_column :node_types, :cpu_clock_speed_mhz, :integer
  end
end
