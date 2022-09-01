class AdminsDashboard::RecipeTypesController < AdminsDashboardController
  def index
    @recipe_types = RecipeType.all
  end
  
  def new
    @recipe_type = RecipeType.new
  end
  def create
    @recipe_type = RecipeType.new(recipe_type_params)
    if @recipe_type.save
      redirect_to admins_dashboard_recipe_types_path, notice: 'Informações foram salvas com sucesso!'
    else
      render :new
    end
  end

  def destroy 
    @recipe_type = RecipeType.find(params[:id])
    if @recipe_type.destroy
      redirect_to admins_dashboard_recipe_types_path, notice: "culinária excluida com sucesso!"
    else
      redirect_to admins_dashboard_recipe_types_path, alert: "Não foi possível excluir a culinária!"
    end
  end

  private

  def recipe_type_params
    params.require(:recipe_type).permit(:name)
  end
end