class RecipeTypesController < ApplicationController
  def new
    @recipe_type = RecipeType.new
  end
  def create
    @recipe_type = RecipeType.new(recipe_type_params)
    if @recipe_type.save
      flash[:notice] = 'Informações foram salvas com sucesso!'
      return redirect_to (new_recipe_type_path)
    end
    render :new
  end

  private

  def recipe_type_params
    params.require(:recipe_type).permit(:name)
  end
end