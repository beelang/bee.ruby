require "spec_helper"

RSpec.describe Dragon::Reader do
  let(:reader) do
    described_class.new
  end

  describe "#lookup" do
    let(:lookup) do
      reader.lookup
    end

    it "matches a lookup with no arguments" do
      expect(lookup).to parse(%|word()|)
    end

    it "matches a lookup with an arguments" do
      expect(lookup).to parse(%|word( 1 )|)
    end

    it "matches a lookup with a single numeric argument" do
      expect(lookup).to parse(%|word( num1: 1 )|)
    end

    it "matches a lookup with multiple numeric arguments" do
      expect(lookup).to parse(%|word( num1: 1 , num2: 2 )|)
    end

    it "doesn't match a lookup with two arguments" do
      expect(lookup).to_not parse(%|word( 1 , 2 )|)
    end

    it "matches a lookup with a single word argument" do
      expect(lookup).to parse(%|need( Twitter )|)
    end
  end
end
