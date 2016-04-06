require "spec_helper"

RSpec.describe Dragon::Reader do
  let(:reader) do
    described_class.new
  end

  describe "#narguments" do
    let(:narguments) do
      reader.narguments
    end

    it "matches a single named argument" do
      expect(narguments).to parse(%| num1: 1 |)
    end

    it "matches multiple named arguments" do
      expect(narguments).to parse(%| num1: 1 , num2: 2 |)
    end
  end
end
