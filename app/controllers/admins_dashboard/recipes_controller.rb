class AdminsDashboard::RecipesController < AdminsDashboardController
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
      if @recipe.save!
        @recipe.published!
        redirect_to admins_dashboard_root_path
      else
        render :new
      end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to admins_dashboard_root_path, notice: "Receita excluida com sucesso!"
    else 
      redirect_to admins_dashboard_root_path, alert: "Não foi possível exluir a receita!"
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