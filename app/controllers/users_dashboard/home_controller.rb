class UsersDashboard::HomeController < UsersDashboardController
  def index
    @recipes = Recipe.published
  end
end
