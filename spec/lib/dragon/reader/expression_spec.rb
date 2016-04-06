require "spec_helper"

RSpec.describe Dragon::Reader do
  let(:reader) do
    described_class.new
  end

  describe "#expression" do
    let(:expression) do
      reader.expression
    end

    it "parses a local lookup" do
      expect(expression).to parse(%|word1()|)
    end

    it "parses a named lookup" do
      expect(expression).to parse(%|Word1()|)
    end

    it "parses definition with a local lookup as the value" do
      expect(expression).to parse(%|word: word1()|)
    end

    it "parses named definition with a local lookup as the value" do
      expect(expression).to parse(%|Word: word1()|)
    end

    it "parses lookup chain with no arguments" do
      expect(expression).to parse(%|word1() word2()|)
    end

    it "parses lookup chain with a single numeric argument" do
      expect(expression).to parse(%|word1( num1: 1 ) word2( num2: 2 )|)
    end

    it "parses a definition with a lookup as a value, on a lookup" do
      expect(expression).to parse(%|this() username: username()|)
    end
  end
end
