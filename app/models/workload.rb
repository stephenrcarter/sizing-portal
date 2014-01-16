class Workload < ActiveRecord::Base
  belongs_to :environment
  has_one :vdi_workload
  has_one :database_workload
  has_one :workload_requirement
  accepts_nested_attributes_for :vdi_workload, :database_workload, :workload_requirement
end
