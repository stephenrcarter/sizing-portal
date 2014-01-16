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
    @workload.database_workload = DatabaseWorkload.new(
      params[:database_workload].permit(:num_database_vms,        
                                        :num_cpus_per_database_vm,
                                        :mhz_per_database_vm,
                                        :memory_per_database_vm_mb,
                                        :capacity_per_database_vm_mb,
                                        :working_set_per_database_vm_mb,
                                        :peak_iops_per_database_vm))
    if @workload.database_workload.save
      @environment = Environment.find(@workload.environment_id)
      redirect_to @environment, :notice => "Your database workload was saved"
    else
      render "new"
    end
  end

  def update
    @workload = Workload.find(params[:id])
    @environment = Environment.find(@workload.environment_id)

    if @workload.database_workload.update(
         params[:database_workload].permit(:num_database_vms,
                                           :num_cpus_per_database_vm,
                                           :mhz_per_database_vm,
                                           :memory_per_database_vm_mb,
                                           :capacity_per_database_vm_mb,
                                           :working_set_per_database_vm_mb,
                                           :peak_iops_per_database_vm))
      redirect_to @environment
    else
      render "edit"
    end
  end
end
