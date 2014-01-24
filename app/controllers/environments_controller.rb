class EnvironmentsController < ApplicationController
  def index
    @environments = Environment.all
  end

  def show
    @environment = Environment.find(params[:id])
    num_vms_total = 0
    num_cores_total = 0
    cpu_cycles_mhz_total = 0
    memory_mb_total = 0
    disk_capacity_mb_total = 0
    ssd_capacity_mb_total = 0
    iops_total = 0
    @environment.workloads.each do |workload|
      num_vms_total += workload.workload_requirement.num_vms
      num_cores_total += workload.workload_requirement.num_cores
      cpu_cycles_mhz_total += workload.workload_requirement.cpu_cycles_mhz
      memory_mb_total += workload.workload_requirement.memory_mb
      disk_capacity_mb_total += workload.workload_requirement.disk_capacity_mb
      ssd_capacity_mb_total += workload.workload_requirement.ssd_capacity_mb
      iops_total += workload.workload_requirement.peak_iops
    end
    environment_requirement = EnvironmentRequirement.new
    environment_requirement.num_vms = num_vms_total
    environment_requirement.cpu_cores = num_cores_total
    environment_requirement.cpu_cycles_mhz = cpu_cycles_mhz_total
    environment_requirement.memory_mb = memory_mb_total
    environment_requirement.disk_capacity_mb = disk_capacity_mb_total
    environment_requirement.ssd_capacity_mb = ssd_capacity_mb_total
    environment_requirement.peak_iops = iops_total

    @environment.environment_requirement = environment_requirement
    @environment.environment_requirement.save
  end

  def new
    @environment = Environment.new  
  end

  def create
    @environment = Environment.new(environment_params)
    if @environment.save
      redirect_to @environment, :notice => "Your post was saved"
    else
      render "new"
    end
  end

  def edit
    @environment = Environment.find(params[:id])
  end

  def update
    @environment = Environment.find(params[:id])

    if @environment.update(environment_params)
      redirect_to @environment
    else
      render "edit"
    end
  end

  def destroy
    @environment = Environment.find(params[:id])
    @environment.destroy

    redirect_to environments_path
  end


  private
    def environment_params
      params.require(:environment).permit(:title)
    end
end
