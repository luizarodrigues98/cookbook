class AdminsDashboard::ReviewsController < AdminsDashboardController
    def index
      @recipes = Recipe.in_review
    end
  
    def show
      @recipe = Recipe.find(params[:id])
    end
  
  
    def edit
      @recipe = Recipe.find(params[:id])
      @recipe_types = RecipeType.all
      @cuisines = Cuisine.all
    end
  
    def update
      @recipe = Recipe.find(params[:id])
      
      if @recipe.update(recipe_params)
        @recipe.published! if params[:commit] == 'Salvar e publicar'
        redirect_to admins_dashboard_reviews_path
      else
        render :edit
      end
    end

    def destroy 
      @recipe = Recipe.find(params[:id])
      if @recipe.destroy
        redirect_to admins_dashboard_reviews_path, notice: "Receita excluida com sucesso!"
      else
        redirect_to admins_dashboard_reviews_path, alert: "Não foi possível excluir a receita!"
      end
    end
  
    def publish
      recipe = Recipe.find(params[:id])
      recipe.published!
      redirect_to admins_dashboard_reviews_path, notice: "Receita publicada com sucesso!"
    end
  
    private
  
    def recipe_params
      params.require(:recipe).permit(
        :name, :recipe_type_id, :cuisine_id, 
        :ingredients, :cook_method, :cook_time
      )
    end
end