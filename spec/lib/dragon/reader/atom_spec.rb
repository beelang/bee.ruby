require "spec_helper"

RSpec.describe Dragon::Reader do
  let(:reader) do
    described_class.new
  end

  describe "#word" do
    let(:word) do
      reader.word
    end

    context "with a single characters" do
      it "parses a lower case alpha-only word" do
        expect(word).to parse(%|a|)
      end

      it "parses a upper case symbol-only word" do
        expect(word).to parse(%|A|)
      end

      it "parses a symbol-only word" do
        expect(word).to parse(%|$|)
      end

      it "parses a numeric-only word" do
        expect(word).to parse(%|1|)
      end
    end

    context "with multiple characters" do
      it "parses a lower case alpha-only word" do
        expect(word).to parse(%|aa|)
      end

      it "parses a upper case alpha-only word" do
        expect(word).to parse(%|AA|)
      end

      it "parses a mixed case, upper leading, alpha-only word" do
        expect(word).to parse(%|Aa|)
      end

      it "parses a mixed case, lower leading, alpha-only word" do
        expect(word).to parse(%|aA|)
      end

      it "parses a symbol-only word" do
        expect(word).to parse(%|$!|)
      end

      it "parses a numeric-only word" do
        expect(word).to parse(%|12|)
      end
    end
  end
end
