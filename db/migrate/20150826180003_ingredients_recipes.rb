class IngredientsRecipes < ActiveRecord::Migration
  def change
    create_table(:ingredients_recipes) do |t|
    t.column(:recipe_id, :integer)
    t.column(:ingredient_id, :integer)
    t.timestamps
  end
end
end
