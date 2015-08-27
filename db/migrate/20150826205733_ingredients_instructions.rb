class IngredientsInstructions < ActiveRecord::Migration
  def change
    create_table(:ingredients_instructions) do |t|
      t.column(:ingredient_id, :integer)
      t.column(:instruction_id, :integer)
      t.timestamps
    end
  end
end
