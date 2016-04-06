require "spec_helper"

RSpec.describe Dragon::Reader do
  let(:reader) do
    described_class.new
  end

  describe "#line" do
    let(:line) do
      reader.line
    end

    context "without indentation" do
      it "parses a simple line" do
        expect(line).to parse("word()\n")
      end

      it "parses just a newline" do
        expect(line).to parse("\n")
      end
    end

    context "with a single indentation" do
      it "parses a simple line" do
        expect(line).to parse("  word()\n")
      end

      it "parses just a newline" do
        expect(line).to parse("  \n")
      end
    end

    context "with a multiple indentation" do
      it "parses a simple line" do
        expect(line).to parse("    word()\n")
      end

      it "parses just a newline" do
        expect(line).to parse("    \n")
      end
    end
  end
end

# rule(:line) do
#    indentation.repeat >> expression.as(:expression) | newline
# end
