class RemoveCuisineFromRecipe < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :cuisine, :string
    add_reference :recipes, :cuisine, foreign_key: true, null: false, default: 0
  end
end
