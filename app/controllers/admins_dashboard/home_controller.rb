class AdminsDashboard::HomeController < AdminsDashboardController
  def index
    @recipes = Recipe.published
  end
end
