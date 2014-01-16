class CreateEnvironments < ActiveRecord::Migration
  def change
    create_table :environments do |t|
      t.string :title

      t.timestamps
    end
  end
end
