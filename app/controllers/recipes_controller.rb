class RecipesController<ApplicationController
  before_action :set_recipe, only:[:show, :edit, :update]
  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.first
    if @recipe.save
      flash[:success] = "Recipe Sucessfully Created"
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      flash[:success] = "Recipe edited successfully"
      render :show
    else
      render :edit
    end
  end

  def destroy
    Recipe.find(params[:id]).destroy
    flash[:success] = "Recipe deleted successfully"
    render :index
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

end
