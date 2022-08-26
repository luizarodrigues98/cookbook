class AdminsDashboard::HomeController < AdminsDashboardController
  def index
    @recipes = Recipe.all
  end
end
