class CreateWorkloadTypes < ActiveRecord::Migration
  def change
    create_table :workload_types do |t|
      t.string :workload_type_name

      t.timestamps
    end
  end
end
