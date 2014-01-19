class WorkloadRequirementsController < ApplicationController
  def show
    @workload_requirement = WorkloadRequirement.find(params[:id])
  end

  def new
    @workload_requirement = WorkloadRequirement.new
    @workload = Workload.find(params[:workload_id])
  end

  def edit
    @workload_requirement = WorkloadRequirement.find(params[:id])
    @workload = Workload.find(@workload_requirement.workload_id)
  end

  def create
    @workload = Workload.find(params[:workload_id])

    @workload.workload_requirement = WorkloadRequirement.new(
      params[:workload_requirement].permit(:num_vms,
                                           :num_cores,
                                           :cpu_cycles_mhz,
                                           :memory_mb,
                                           :disk_capacity_mb,
                                           :ssd_capacity_mb))
    if @workload.workload_requirement.save
      @environment = Environment.find(@workload.environment_id)
      redirect_to @environment, :notice => "Your workload requirements were saved"
    else
      render "new"
    end
  end

  def update
    @workload = Workload.find(params[:id])
    @environment = Environment.find(@workload.environment_id)

    if @workload.workload_requirement.update(
      params[:workload_requirement].permit(:num_vms,
                                           :num_cores,
                                           :cpu_cycles_mhz,
                                           :memory_mb,
                                           :disk_capacity_mb,
                                           :ssd_capacity_mb))
      redirect_to @environment
    else
      render "edit"
    end
  end
end
