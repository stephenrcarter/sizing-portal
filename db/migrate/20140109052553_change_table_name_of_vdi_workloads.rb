class ChangeTableNameOfVdiWorkloads < ActiveRecord::Migration
  def change
    rename_table :vdi_workloads, :vdiworkloads
  end
end
