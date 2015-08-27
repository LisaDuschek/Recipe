class Instruction < ActiveRecord::Base
  belongs_to(:recipe)
  has_many(:ingredients)

validates(:description, {:presence => true})

end
