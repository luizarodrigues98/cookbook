class AdminsDashboard::CuisinesController < AdminsDashboardController
  
  def index
    @cuisines = Cuisine.all
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.new(cuisine_params)
    if @cuisine.save
      redirect_to admins_dashboard_cuisines_path, notice: 'Informações foram salvas com sucesso!'
    else
      render :new
    end
  end

  def destroy 
    @cuisine = Cuisine.find(params[:id])
    if @cuisine.destroy
      redirect_to admins_dashboard_cuisines_path, notice: "culinária excluida com sucesso!"
    else
      redirect_to admins_dashboard_cuisines_path, alert: "Não foi possível excluir a culinária!"
    end
  end
  
  private 

  def cuisine_params
    params.require(:cuisine).permit(:name)
  end
end