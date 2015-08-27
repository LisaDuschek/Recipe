class DropOrderFromInstructions < ActiveRecord::Migration
  def change
    remove_column(:instructions, :order, :integer)
  end
end
