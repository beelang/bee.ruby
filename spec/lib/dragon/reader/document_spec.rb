require "spec_helper"

RSpec.describe Dragon::Reader do
  let(:reader) do
    described_class.new
  end

  describe "#document" do
    let(:document) do
      reader.document
    end

    it "parses a named definition" do
      expect(document).to parse(%|Word: 1\n|)
    end

    it "parses a named definition with a local ookup" do
      expect(document).to parse(%|Word: Object() clone()\n|)
    end

    it "parses an object definition" do
      expect(document).to parse(%|Word: Object() clone()\n  foo: 1\n|)
    end

    it "parses an deeply nested object definition" do
      expect(document).to parse(%|Word: Object() clone()\n  foo: method()\n    print( "foo" )\n|)
    end

    it "parses just a comment" do
      expect(document).to parse(%|# This is a stupid comment\n|)
    end

    it "parses lots of comment" do
      expect(document).to parse(%|# This is a stupid comment\n#\n# So is this one\n|)
    end

    it "parses of indented comment" do
      expect(document).to parse(%|foo: method()\n  # So is this one\n  print( "1" )\n|)
    end

    it "parses a multispaced file" do
      expect(document).to parse(%|foo()\n\nfoo()\n|)
    end

    it "parses a full script" do
      expect(document).to parse(%|Word: 1\nWord: Object() clone()\nWord: Object() clone()\n  foo: 1\nWord: Object() clone()\n  foo: method()\n    print( "foo" )\n# This is a stupid comment\n# This is a stupid comment\n#\n# So is this one\nfoo: method()\n  # So is this one\n  print( "1" )\nfoo()\n\nfoo()\n|)
    end
  end
end
