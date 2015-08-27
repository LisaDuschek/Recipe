class CreateRecipeIdColumnInInstructions < ActiveRecord::Migration
  def change
    add_column(:instructions, :recipe_id, :integer)
  end
end
