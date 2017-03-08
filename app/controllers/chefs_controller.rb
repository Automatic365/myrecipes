class ChefsController<ApplicationController
  before_action :set_chef, only:[:edit, :show, :update]

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
  end

  def edit
  end

  def update
    if @chef.update(chef_params)
      flash[:success] = "Chef updated successfully"
      render :show
    else
      render :edit
    end
  end

  private

  def chef_params
    params.require(:chef).permit(:chefname, :email, :password)
  end

  def set_chef
    @chef = Chef.find(params[:id])
  end


end
