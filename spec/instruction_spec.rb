require('spec_helper')

describe(Instruction) do
  it("ensures a description exists") do
    instruction = Instruction.new({:description => ""})
    expect(instruction.save()).to(eq(false))
  end

end
