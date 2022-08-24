class CuisinesController < ApplicationController
  def new
    @cuisine = Cuisine.new
  end
  def create
    @cuisine = Cuisine.new(cuisine_params)
    if @cuisine.save
      flash[:notice] = 'Informações foram salvas com sucesso!'
      return redirect_to (new_cuisine_path)
    end
    render :new
  end
  
  private 

  def cuisine_params
    params.require(:cuisine).permit(:name)
  end
end