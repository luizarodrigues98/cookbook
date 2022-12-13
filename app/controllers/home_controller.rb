class HomeController < ApplicationController
  layout 'public'
  
  def index
    @recipes = Recipe.published
  end

end