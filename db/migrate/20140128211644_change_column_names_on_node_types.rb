class ChangeColumnNamesOnNodeTypes < ActiveRecord::Migration
  def change
    rename_column :node_types, :ssd_raw_size_gb, :ssd_raw_size_mb
    rename_column :node_types, :hdd_raw_size_gb, :hdd_raw_size_mb
  end
end
