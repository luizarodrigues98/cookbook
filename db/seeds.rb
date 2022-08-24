DEFAULT_PASSWORD = 123456 

Admin.find_or_create_by(email: 'admin@admin.com') do |admin|
  admin.password = DEFAULT_PASSWORD
  admin.password_confirmation = DEFAULT_PASSWORD
end

User.find_or_create_by(email: 'user@user.com') do |user|
  user.password = DEFAULT_PASSWORD
  user.password_confirmation = DEFAULT_PASSWORD
end

recipe_type = RecipeType.find_or_create_by(name: 'Sobremesa') 

cuisine = Cuisine.find_or_create_by(name: 'Brasileira')

Recipe.find_or_create_by(name: 'Pudim') do |recipe|
  recipe.ingredients = 'leite e leite condensado'
  recipe.cook_method = 'Levar ao banho maria'
  recipe.cook_time = 120
  recipe.recipe_type_id = recipe_type.id
  recipe.cuisine_id = recipe_type.id
end