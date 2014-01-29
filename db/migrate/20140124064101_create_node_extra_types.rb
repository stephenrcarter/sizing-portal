class CreateNodeExtraTypes < ActiveRecord::Migration
  def change
    create_table :node_extra_types do |t|
      t.string :name
      t.string :description
      t.references :node_type, index: true

      t.timestamps
    end
  end
end
