class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.paginate(page: params[:page], per_page: 5)
  end

end
