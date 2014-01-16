class CreateWorkloads < ActiveRecord::Migration
  def change
    create_table :workloads do |t|
      t.string :workload_name
      t.references :environment, index: true
      t.references :workload_type, index: true

      t.timestamps
    end
  end
end
