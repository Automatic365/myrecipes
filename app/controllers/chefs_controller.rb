class ChefsController<ApplicationController

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = "Chef created successfully"
      render :show
    else
      render :new
    end
  end

  def show
    @chef = Chef.find(params[:id])
  end

  private

  def chef_params
    params.require(:chef).permit(:chefname, :email, :password)
  end


end
