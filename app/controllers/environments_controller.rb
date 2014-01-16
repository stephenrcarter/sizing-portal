class EnvironmentsController < ApplicationController
  def index
    @environments = Environment.all
  end

  def show
    @environment = Environment.find(params[:id])
  end

  def new
    @environment = Environment.new  
  end

  def create
    @environment = Environment.new(params[:environment].permit(:title))
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

    if @environment.update(params[:environment].permit(:title))
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
