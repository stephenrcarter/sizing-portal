class WorkloadsController < ApplicationController
  def index
    @workloads = Workload.all
  end

  def show
    @workload = Workload.find(params[:id])
  end 

  def new
    @workload_types = WorkloadType.all
    @workload = Workload.new
    @environment = Environment.find(params[:environment_id])
  end

  def edit
    @workload_types = WorkloadType.all
    @workload = Workload.find(params[:id])
  end

  def create
    @workload_types = WorkloadType.all

    @environment = Environment.find(params[:environment_id])
    @workload = @environment.workloads.create(params[:workload].permit(:workload_name, :workload_type_id))
    
    # Should redirect to the workload create view (either VDI or SQL)
    @workload_type = @workload_types.find(@workload.workload_type_id)
    @workload_type_name = @workload_type.workload_type_name

    if @workload_type_name == "VDI"
      redirect_to new_workload_vdi_workload_path(:workload_id=>@workload.id)
    elsif @workload_type_name == "Database"
      redirect_to new_workload_database_workload_path(:workload_id=>@workload.id)
    elsif @workload_type_name == "Manual"
      redirect_to new_workload_workload_requirement_path(:workload_id=>@workload.id)
    end
  end

  def update
    @workload = Workload.find(params[:id])
    @environment = Environment.find(@workload.environment_id)

    if @workload.update(params[:workload].permit(:workload_name))
      redirect_to @environment
    else
      render "edit"
    end
  end

  def destroy
    @workload = Workload.find(params[:id])
    if @workload.vdi_workload != nil
      @workload.vdi_workload.destroy
    end
    if @workload.database_workload != nil
      @workload.database_workload.destroy
    end
    if @workload.workload_requirement != nil
      @workload.workload_requirement.destroy
    end
    @workload.destroy
    
    @environment = Environment.find(@workload.environment_id)
    redirect_to @environment
  end

  private
    def workload_params
      params.require(:workload).permit(:workload_name)
    end
end
