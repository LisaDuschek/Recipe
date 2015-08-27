require('spec_helper')

describe(Tag) do
  it("ensures a category exists") do
    tag = Tag.new({:category => ""})
    expect(tag.save()).to(eq(false))
  end

end
