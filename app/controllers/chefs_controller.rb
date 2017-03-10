class ChefsController<ApplicationController
  before_action :set_chef, only:[:edit, :show, :update]

  def index
    @chefs = Chef.paginate(page: params[:page], per_page: 5)
  end

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
    @chef_recipes = @chef.recipes.paginate(page: params[:page], per_page: 5)
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

  def destroy
    @chef = Chef.find(params[:id])
    @chef.destroy
    flash[:danger] = "Chef and all associated recipes have been deleted"
    redirect_to chefs_path
  end

  private

  def chef_params
    params.require(:chef).permit(:chefname, :email, :password)
  end

  def set_chef
    @chef = Chef.find(params[:id])
  end


end
