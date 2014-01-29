class ChangeColumnNamesOnNodeTypesAgain < ActiveRecord::Migration
  def change
    rename_column :node_types, :ssd_raw_size_mb, :ssd_raw_size_gb
    rename_column :node_types, :hdd_raw_size_mb, :hdd_raw_size_gb
  end
end
