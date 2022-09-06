class AdminsDashboard::HomeController < AdminsDashboardController
  def index
    @recipes = Recipe.published.order(:id).page(params[:page]).per(5)
  end
end
