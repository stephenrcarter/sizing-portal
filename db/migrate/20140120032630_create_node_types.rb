class CreateNodeTypes < ActiveRecord::Migration
  def change
    create_table :node_types do |t|
      t.string :name
      t.integer :nodes_per_block
      t.integer :ssd_count
      t.integer :ssd_raw_size_gb
      t.integer :hdd_count
      t.integer :hdd_raw_size_gb
      t.integer :cpu_socket_count
      t.integer :cpu_cores_per_socket
      t.float :cpu_clock_speed_ghz
      t.integer :memory_capacity_gb
      t.string :add_on_cards
      t.float :list_price

      t.timestamps
    end
  end
end
