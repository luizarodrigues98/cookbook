class RecipesController < ApplicationController
  def index
    @recipes = Recipe.draft
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      @recipe.in_review! if params[:commit] == 'Salvar e publicar'
      redirect_to recipe_path(@recipe.id)
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe.id)
    else
      render :edit
    end
  end

  def publish
    recipe = Recipe.find(params[:id])
    recipe.published!
    return redirect_to recipe_path(recipe.id)
  end

  def draft
    recipe = Recipe.find(params[:id])
    recipe.draft!
    return redirect_to recipe_path(recipe.id)
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :name, :recipe_type_id, :cuisine_id, 
      :ingredients, :cook_method, :cook_time
    )
  end
end