require('spec_helper')

describe(Ingredient) do
  it("ensures a name exists") do
    ingredient = Ingredient.new({:name => ""})
    expect(ingredient.save()).to(eq(false))
  end

end
