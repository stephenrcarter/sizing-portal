class RemoveMemoryFromNodeTypesTable < ActiveRecord::Migration
  def change
    remove_column :node_types, :memory_capacity_gb
  end
end
