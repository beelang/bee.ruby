require "spec_helper"

RSpec.describe Dragon::Reader do
  let(:reader) do
    described_class.new
  end

  describe "#comment" do
    let(:comment) do
      reader.comment
    end

    it "parses a line with no data" do
      expect(comment).to parse("#")
    end

    it "parses a line with data" do
      expect(comment).to parse("# foo bar baz")
    end
  end
end
