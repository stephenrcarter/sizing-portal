class DropTable < ActiveRecord::Migration
  def change
    drop_table :environment_requirements
  end
end
