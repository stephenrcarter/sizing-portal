class DatabaseWorkloadsController < ApplicationController
  def show
    @database_workload = DatabaseWorkload.find(params[:id])
  end

  def new
    @database_workload = DatabaseWorkload.new
    @workload = Workload.find(params[:workload_id])
  end

  def edit
    @database_workload = DatabaseWorkload.find(params[:id])
    @workload = Workload.find(@database_workload.workload_id)
  end

  def create
    @workload = Workload.find(params[:workload_id])
    @workload.database_workload = DatabaseWorkload.new(database_workload_params)
    if @workload.database_workload.save
      @environment = Environment.find(@workload.environment_id)
      generate_workload_requirement
      redirect_to @environment, :notice => "Your database workload was saved"
    else
      render "new"
    end
  end

  def update
    @workload = Workload.find(params[:id])
    @environment = Environment.find(@workload.environment_id)

    if @workload.database_workload.update(database_workload_params)
      update_workload_requirement
      redirect_to @environment
    else
      render "edit"
    end
  end

  private
    def database_workload_params
      params.require(:database_workload).permit(:num_database_vms,
                                                :num_vcpus_per_database_vm,
                                                :mhz_per_database_vm,
                                                :memory_per_database_vm_mb,
                                                :capacity_per_database_vm_mb,
                                                :working_set_per_database_vm_mb,
                                                :peak_iops_per_database_vm)
    end

    def update_workload_requirement
      workload_requirement = 
        set_workload_requirement(@workload.database_workload, 
                                 @workload.workload_requirement)
      @workload.workload_requirement.save
    end

    def generate_workload_requirement
      workload_requirement = 
        set_workload_requirement(@workload.database_workload, 
                                 WorkloadRequirement.new)
      @workload.workload_requirement = workload_requirement
      @workload.workload_requirement.save
    end 
 
    def set_workload_requirement(database_workload, workload_requirement)
      num_vms = database_workload.num_database_vms
      workload_requirement.num_vms = num_vms
      workload_requirement.num_cores = 
        database_workload.num_vcpus_per_database_vm * num_vms
      workload_requirement.cpu_cycles_mhz = 
        database_workload.mhz_per_database_vm * num_vms
      workload_requirement.memory_mb = 
        database_workload.memory_per_database_vm_mb * num_vms
      workload_requirement.disk_capacity_mb = 
        database_workload.capacity_per_database_vm_mb * num_vms
      workload_requirement.ssd_capacity_mb = 
        database_workload.working_set_per_database_vm_mb * num_vms
      workload_requirement.peak_iops =
        database_workload.peak_iops_per_database_vm * num_vms
      return workload_requirement 
    end
end
