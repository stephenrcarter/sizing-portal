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
      redirect_to @environment, :notice => "Your vdi workload was saved"
      
      # Create the workload requirements for this workload.
      self.generate_workload_requirement(@workload)
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
                                           :vcpus_per_physical_core, 
                                           :memory_overcommit_percent)) 
    end

    def generate_workload_requirement(workload)
      
    end
end
