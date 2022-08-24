class AddColumsToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :cuisine, :string
    add_column :recipes, :ingredients, :string
    add_column :recipes, :cook_method, :string
    add_column :recipes, :cook_time, :integer
  end
end
