class CreateNodeExtras < ActiveRecord::Migration
  def change
    create_table :node_extras do |t|
      t.references :node_extra_type, index: true

      t.timestamps
    end
  end
end
