require "spec_helper"

RSpec.describe Dragon::Reader do
  let(:reader) do
    described_class.new
  end

  describe "#newline" do
    let(:newline) do
      reader.newline
    end

    it "parses newline" do
      expect(newline).to parse(%|\n|)
    end

    it "parses return" do
      expect(newline).to parse(%|\r|)
    end
  end

  describe "#eof" do
    let(:eof) do
      reader.eof
    end

    it "parses empty" do
      expect(eof).to parse(%||)
    end
  end

  describe "#space" do
    let(:space) do
      reader.space
    end

    it "parses space" do
      expect(space).to parse(%| |)
    end
  end

  describe "#indentation" do
    let(:indentation) do
      reader.indentation
    end

    it "parses indentation" do
      expect(indentation).to parse(%|  |)
    end
  end

  describe "#character" do
    let(:character) do
      reader.character
    end

    it "parses alpha character" do
      expect(character).to parse(%|a|)
    end

    it "parses capital alpha character" do
      expect(character).to parse(%|A|)
    end

    it "parses numeric character" do
      expect(character).to parse(%|1|)
    end

    it "doesn't match a newline character" do
      expect(character).to_not parse(%|\n|)
    end
  end

  describe "#text" do
    let(:text) do
      reader.text
    end

    it "parses a text with one lower case alpha character" do
      expect(text).to parse(%|"a"|)
    end

    it "parses a text with multiple lower case alpha character" do
      expect(text).to parse(%|"aaa"|)
    end
  end
end
