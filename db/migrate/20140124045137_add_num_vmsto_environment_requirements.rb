class AddNumVmstoEnvironmentRequirements < ActiveRecord::Migration
  def change
    add_column :environment_requirements, :num_vms, :integer
  end
end
