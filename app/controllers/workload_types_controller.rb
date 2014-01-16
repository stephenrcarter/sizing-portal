class WorkloadTypesController < ApplicationController
  def index
    @workload_types = WorkloadType.all
  end

  def show
    @workload_type = WorkloadType.find(params[:id])
  end

  def new
    @workload_type = WorkloadType.find(params[:id])
  end

  def create
    @workload_type = WorkloadType.new(params[:workload_type].permit(:workload_type_name))
    @workload_type.save
  end

  def destroy
    @workload_type = WorkloadType.find(params[:id])
    @workload_type.destroy
  end
end
