require "spec_helper"

RSpec.describe Dragon::Reader do
  let(:reader) do
    described_class.new
  end

  describe "#definition" do
    let(:definition) do
      reader.definition
    end

    it "matches a simple numeric definition" do
      expect(definition).to parse(%|word: 1|)
    end

    it "matches a simple string definition" do
      expect(definition).to parse(%|word: "a"|)
    end

    it "matches a definition with a lookup" do
      expect(definition).to parse(%|word: verb()|)
    end

    it "matches a definition with a lookup that has a argument" do
      expect(definition).to parse(%|word: verb( 1 )|)
    end

    it "matches a definition with a lookup that has named arguments" do
      expect(definition).to parse(%|word: verb( a: 1 , b: 2 )|)
    end

    it "doesn't match a definition with post-colon bad spacing" do
      expect(definition).to_not parse(%|word :"a"|)
    end

    it "doesn't match a definition with pre-colon bad spacing" do
      expect(definition).to_not parse(%|word : "a"|)
    end
  end
end
