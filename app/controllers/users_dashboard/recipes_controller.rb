class UsersDashboard::RecipesController < UsersDashboardController
  
  def index
    @draft_recipes = current_user.recipes.draft
    @published_recipes = current_user.recipes.published
  end

  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
      if @recipe.save!
        @recipe.draft!
        redirect_to users_dashboard_recipe_path(:id)
      else
        render :new
      end
  end
  def publish
    @recipe = Recipe.find(params[:id])
    @recipe.in_review!
    return redirect_to users_dashboard_recipe_path(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to users_dashboard_root_path, notice: "Receita excluida com sucesso!"
    else 
      redirect_to users_dashboard_root_path, alert: "Não foi possível exluir a receita!"
    end
  end
  
  private

  def recipe_params
    params.require(:recipe).permit(
      :name, :recipe_type_id, :cuisine_id, 
      :ingredients, :cook_method, :cook_time
    )
  end
end