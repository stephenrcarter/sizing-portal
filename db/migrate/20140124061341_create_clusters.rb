class CreateClusters < ActiveRecord::Migration
  def change
    create_table :clusters do |t|
      t.references :environment, index: true

      t.timestamps
    end
  end
end
