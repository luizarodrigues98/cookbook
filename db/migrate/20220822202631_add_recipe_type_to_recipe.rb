class AddRecipeTypeToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_reference :recipes, :recipe_type, foreign_key: true, null: false, default: 0 
  end
end
