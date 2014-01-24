class VdiWorkloadsController < ApplicationController
  def show
    @vdi_workload = VdiWorkload.find(params[:id])
  end

  def new
    @vdi_workload = VdiWorkload.new
    @workload = Workload.find(params[:workload_id])
  end

  def edit
    @vdi_workload = VdiWorkload.find(params[:id])
    @workload = Workload.find(@vdi_workload.workload.id)
  end

  def create
    @workload = Workload.find(params[:workload_id])

    @workload.vdi_workload = VdiWorkload.new(vdi_workload_params)
    if @workload.vdi_workload.save
      @environment = Environment.find(@workload.environment_id)
      # Create the workload requirements for this workload.
      generate_workload_requirement
    
      redirect_to @environment, :notice => "Your vdi workload was saved"
    else
      render "new"
    end
    # redirect_to environment_workload_path(:id=>@workload.id)
  end

  def update
    #@vdi_workload = VdiWorkload.find(params[:id])
    @workload = Workload.find(params[:id])
    @environment = Environment.find(@workload.environment_id)  

    if @workload.vdi_workload.update(vdi_workload_params)
      update_workload_requirement
      redirect_to @environment
    else
      render "edit"
    end
  end

  private
    def vdi_workload_params
      params.require(:vdi_workload).permit(:num_desktops,    
                                           :num_vcpus_per_desktop, 
                                           :mhz_per_desktop, 
                                           :memory_per_desktop_mb, 
                                           :capacity_per_desktop_mb, 
                                           :desktop_concurrency_percent, 
                                           :vcpus_per_core, 
                                           :memory_overcommit_percent,
                                           :peak_iops_per_desktop)
    end

    def update_workload_requirement
      workload_requirement =
        set_workload_requirement(@workload.vdi_workload,
                                 @workload.workload_requirement)
      @workload.workload_requirement.save
    end

    def generate_workload_requirement
      workload_requirement = 
        set_workload_requirement(@workload.vdi_workload, 
                                 WorkloadRequirement.new)
      @workload.workload_requirement = workload_requirement
      @workload.workload_requirement.save
    end

    def set_workload_requirement(vdi_workload, workload_requirement)
      num_vms = vdi_workload.num_desktops * 
        (vdi_workload.desktop_concurrency_percent.to_f/100)
      workload_requirement.num_vms = num_vms
      workload_requirement.num_cores = 
        (vdi_workload.num_vcpus_per_desktop * num_vms) / 
          [1,vdi_workload.vcpus_per_core].max
      workload_requirement.cpu_cycles_mhz = 
        vdi_workload.mhz_per_desktop * num_vms
      workload_requirement.memory_mb = 
        vdi_workload.memory_per_desktop_mb * num_vms
      workload_requirement.disk_capacity_mb =
        vdi_workload.capacity_per_desktop_mb * num_vms
      workload_requirement.peak_iops =
        vdi_workload.peak_iops_per_desktop * num_vms
      # For now no SSD requirements for VDI. If we can come up with a
      # model, we can change this.
      workload_requirement.ssd_capacity_mb = 0
      return workload_requirement
    end
end
