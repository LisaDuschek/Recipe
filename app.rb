require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @recipes = Recipe.all()
  @tags = Tag.all()
  @ingredients = Ingredient.all()
  erb(:index)
end

patch('/recipes/:id') do
  @recipes = Recipe.all()
  update_name = params.fetch('update_name')
  recipe_to_update = Recipe.find(params.fetch("id").to_i())
  recipe_to_update.update({:name => update_name})
  redirect("/")
end

post('/recipes/:id/rating') do
  @recipes = Recipe.all()
  rating = params.fetch('rating').to_i()
  recipe_to_update = Recipe.find(params.fetch("id").to_i())
  recipe_to_update.update({:rating => rating})
  redirect("/")
end

delete('/recipes/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i())
  @recipe.destroy()
  @recipes = Recipe.all()
  redirect("/")
end

get('/recipes/new') do
  erb(:recipe_form)
end

post('/recipes/new') do
  name = params.fetch('name')
  Recipe.create({:name => name})
  redirect("/")
end

get('/recipes/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i())
  @tags = Tag.all()
  erb(:recipe)
end

post('/ingredients/new') do
  @recipe = Recipe.find(params.fetch("recipe_id").to_i())
  name = params.fetch('name')
  amount = params.fetch('amount')
  recipe_id = params.fetch('recipe_id')
  ingredient = Ingredient.new({:name => name, :amount => amount, :recipe_ids => [@recipe.id()]})
  ingredient.save()
  redirect("/recipes/#{@recipe.id().to_i()}")
end

patch('/ingredients/:id/rename') do
  @recipe = Recipe.find(params["recipe_id"].to_i())
  @ingredient = Ingredient.find(params["id"].to_i())
  @ingredient.update({name: params["update_name"]})
  @ingredients = Ingredient.all()
  redirect("/recipes/#{@recipe.id().to_i()}")
end

patch('/ingredients/:id/new_amount') do
  @recipe = Recipe.find(params["recipe_id"].to_i())
  @ingredient = Ingredient.find(params["id"].to_i())
  @ingredient.update({amount: params["update_amount"]})
  @ingredients = Ingredient.all()
  redirect("/recipes/#{@recipe.id().to_i()}")
end

delete('/ingredients/:id') do
  @recipe = Recipe.find(params["recipe_id"].to_i())
  @ingredient = Ingredient.find(params.fetch("id").to_i())
  @ingredient.destroy()
  @ingredients = Ingredient.all()
  redirect("/recipes/#{@recipe.id().to_i()}")
end

post('/instructions/new') do
  @recipe = Recipe.find(params.fetch("recipe_id").to_i())
  description = params.fetch('description')
  recipe_id = params.fetch('recipe_id')
  instruction = Instruction.new({:description => description, :recipe_id => recipe_id})
  instruction.save()
  redirect("/recipes/#{@recipe.id().to_i()}")
end

patch('/instructions/:id/rename') do
  @recipe = Recipe.find(params["recipe_id"].to_i())
  @instruction = Instruction.find(params["id"].to_i())
  @instruction.update({description: params["update_description"]})
  @instructions = Instruction.all()
  redirect("/recipes/#{@recipe.id().to_i()}")
end

delete('/instructions/:id') do
  @recipe = Recipe.find(params["recipe_id"].to_i())
  @instruction = Instruction.find(params.fetch("id").to_i())
  @instruction.destroy()
  @instructions = Instruction.all()
  redirect("/recipes/#{@recipe.id().to_i()}")
end

post('/tags/new') do
  @recipe = Recipe.find(params.fetch("recipe_id").to_i())
  @tags = Tag.all()
  category = params.fetch('category')
  recipe_id = params.fetch('recipe_id')
  tag = Tag.new({:category => category, :recipe_ids => [@recipe.id()]})
  tag.save()
  redirect("/recipes/#{@recipe.id().to_i()}")
end

delete('/tags/:id') do
  @recipe = Recipe.find(params["recipe_id"].to_i())
  tag = Tag.find(params.fetch("id").to_i())
  tag.destroy()
  @tags = Tag.all()
  redirect("/recipes/#{@recipe.id().to_i()}")
end
