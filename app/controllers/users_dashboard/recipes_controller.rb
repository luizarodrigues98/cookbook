class UsersDashboard::RecipesController < UsersDashboardController
  
  def index
    @draft_recipes = current_user.recipes.draft
    @published_recipes = current_user.recipes.published
  end

  def show
    @recipe = Recipe.find(params[:id])
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end
  def edit
    @recipe = Recipe.find(params[:id])
  
  end
  def new
    @recipe = Recipe.new
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save!
      @recipe.in_review! if params[:commit] == 'Salvar e publicar'
      redirect_to users_dashboard_recipe_path(@recipe), notice: 'Informações foram salvas com sucesso!'
    else
      render :new
    end
  end

  def publish
    @recipe = Recipe.find(params[:id])
    @recipe.in_review!
    redirect_to users_dashboard_recipe_path(params[:id])
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
      :ingredients, :cook_method, :cook_time, :user_id
    )
  end
end