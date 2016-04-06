require "spec_helper"

RSpec.describe Dragon::Reader do
  let(:reader) do
    described_class.new
  end

  describe "#sargument" do
    let(:sargument) do
      reader.sargument
    end

    it "matches a number" do
      expect(sargument).to parse(%| 1 |)
    end

    it "matches a string" do
      expect(sargument).to parse(%| "1" |)
    end

    it "matches a lookup" do
      expect(sargument).to parse(%| word() |)
    end
  end
end
