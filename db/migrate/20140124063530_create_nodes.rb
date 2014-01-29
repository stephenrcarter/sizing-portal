class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.references :node_type, index: true
      t.references :cluster, index: true
      t.integer :memory_mb

      t.timestamps
    end
  end
end
