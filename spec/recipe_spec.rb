require('spec_helper')

describe(Recipe) do
  it("ensures a name exists") do
    recipe = Recipe.new({:name => ""})
    expect(recipe.save()).to(eq(false))
  end

end
