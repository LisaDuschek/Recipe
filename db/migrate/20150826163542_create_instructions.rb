class CreateInstructions < ActiveRecord::Migration
  def change
    create_table(:instructions) do |t|
      t.column(:description, :string)
      t.column(:order, :integer)

      t.timestamps
    end
  end
end
