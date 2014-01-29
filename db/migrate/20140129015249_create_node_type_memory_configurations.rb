class CreateNodeTypeMemoryConfigurations < ActiveRecord::Migration
  def change
    create_table :node_type_memory_configurations do |t|
      t.references :node_type, index: true
      t.integer :memory_gb

      t.timestamps
    end
  end
end
