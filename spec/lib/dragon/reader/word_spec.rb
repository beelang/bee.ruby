require "spec_helper"

RSpec.describe Dragon::Reader do
  let(:reader) do
    described_class.new
  end

  describe "#word" do
    let(:word) do
      reader.word
    end

    it "matches word with all upper" do
      expect(word).to parse("AAA")
    end

    it "matches word with all lower" do
      expect(word).to parse("aaa")
    end

    it "matches word with capital alpha prefix" do
      expect(word).to parse("Aaa")
    end

    it "matches word with capital alpha suffix" do
      expect(word).to parse("aaA")
    end

    it "matches a word with all numerics" do
      expect(word).to parse("111")
    end

    it "matches a word with numeric prefix" do
      expect(word).to parse("1aa")
    end

    it "matches a word with numeric suffix" do
      expect(word).to parse("aa1")
    end

    it "matches a word number contents" do
      expect(word).to parse("a1a")
    end

    it "matches a word with all questionmarks" do
      expect(word).to parse("???")
    end

    it "matches a word with questionmark suffix" do
      expect(word).to parse("aa?")
    end

    it "matches a word with questionmark prefix" do
      expect(word).to parse("?aa")
    end

    it "matches a word with questionmark contents" do
      expect(word).to parse("a?a")
    end

    it "matches a word with all bangmarks" do
      expect(word).to parse("!!!")
    end

    it "matches a word with bangmark suffix" do
      expect(word).to parse("aa!")
    end

    it "matches a word with bangmark prefix" do
      expect(word).to parse("!aa")
    end

    it "matches a word with bangmark contents" do
      expect(word).to parse("a!a")
    end

    it "matches a word with all minusmarks" do
      expect(word).to parse("---")
    end

    it "matches a word with minusmark suffix" do
      expect(word).to parse("aa-")
    end

    it "matches a word with minusmark prefix" do
      expect(word).to parse("-aa")
    end

    it "matches a word with minusmark contents" do
      expect(word).to parse("a-a")
    end

    it "matches a word with all plusmarks" do
      expect(word).to parse("+++")
    end

    it "matches a word with plusmark suffix" do
      expect(word).to parse("aa+")
    end

    it "matches a word with plusmark prefix" do
      expect(word).to parse("+aa")
    end

    it "matches a word with plusmark contents" do
      expect(word).to parse("a+a")
    end

    it "matches a word with all atmarks" do
      expect(word).to parse("@@@")
    end

    it "matches a word with atmark suffix" do
      expect(word).to parse("aa@")
    end

    it "matches a word with atmark prefix" do
      expect(word).to parse("@aa")
    end

    it "matches a word with atmark contents" do
      expect(word).to parse("a@a")
    end

    it "matches a word with all starmarks" do
      expect(word).to parse("***")
    end

    it "matches a word with starmark suffix" do
      expect(word).to parse("aa*")
    end

    it "matches a word with starmark prefix" do
      expect(word).to parse("*aa")
    end

    it "matches a word with starmark contents" do
      expect(word).to parse("a*a")
    end

    it "matches a word with all percentmarks" do
      expect(word).to parse("%%%")
    end

    it "matches a word with percentmark suffix" do
      expect(word).to parse("aa%")
    end

    it "matches a word with percentmark prefix" do
      expect(word).to parse("%aa")
    end

    it "matches a word with percentmark contents" do
      expect(word).to parse("a%a")
    end

    it "matches a word with all dollarmarks" do
      expect(word).to parse("$$$")
    end

    it "matches a word with dollarmark suffix" do
      expect(word).to parse("aa$")
    end

    it "matches a word with dollarmark prefix" do
      expect(word).to parse("$aa")
    end

    it "matches a word with dollarmark contents" do
      expect(word).to parse("a$a")
    end

    it "matches a word with all carrotmarks" do
      expect(word).to parse("^^^")
    end

    it "matches a word with carrotmark suffix" do
      expect(word).to parse("aa^")
    end

    it "matches a word with carrotmark prefix" do
      expect(word).to parse("^aa")
    end

    it "matches a word with carrotmark contents" do
      expect(word).to parse("a^a")
    end

    it "matches a word with all ampmarks" do
      expect(word).to parse("&&&")
    end

    it "matches a word with ampmark suffix" do
      expect(word).to parse("aa&")
    end

    it "matches a word with ampmark prefix" do
      expect(word).to parse("&aa")
    end

    it "matches a word with ampmark contents" do
      expect(word).to parse("a&a")
    end

    it "matches a word with all equalmarks" do
      expect(word).to parse("===")
    end

    it "matches a word with equalmark suffix" do
      expect(word).to parse("aa=")
    end

    it "matches a word with equalmark prefix" do
      expect(word).to parse("=aa")
    end

    it "matches a word with equalmark contents" do
      expect(word).to parse("a=a")
    end

    it "matches a word with all undermarks" do
      expect(word).to parse("___")
    end

    it "matches a word with undermark suffix" do
      expect(word).to parse("aa_")
    end

    it "matches a word with undermark prefix" do
      expect(word).to parse("_aa")
    end

    it "matches a word with undermark contents" do
      expect(word).to parse("a_a")
    end

    it "matches a word with all periodmarks" do
      expect(word).to parse("...")
    end

    it "matches a word with periodmark suffix" do
      expect(word).to parse("aa.")
    end

    it "matches a word with periodmark prefix" do
      expect(word).to parse(".aa")
    end

    it "matches a word with periodmark contents" do
      expect(word).to parse("a.a")
    end

    it "matches a word with all lessthanmarks" do
      expect(word).to parse("<<<")
    end

    it "matches a word with lessthanmark suffix" do
      expect(word).to parse("aa<")
    end

    it "matches a word with lessthanmark prefix" do
      expect(word).to parse("<aa")
    end

    it "matches a word with lessthanmark contents" do
      expect(word).to parse("a<a")
    end

    it "matches a word with all greaterthanmarks" do
      expect(word).to parse(">>>")
    end

    it "matches a word with greaterthanmark suffix" do
      expect(word).to parse("aa>")
    end

    it "matches a word with greaterthanmark prefix" do
      expect(word).to parse(">aa")
    end

    it "matches a word with greaterthanmark contents" do
      expect(word).to parse("a>a")
    end

    it "matches a word with all pipemarks" do
      expect(word).to parse("|||")
    end

    it "matches a word with pipemark suffix" do
      expect(word).to parse("aa|")
    end

    it "matches a word with pipemark prefix" do
      expect(word).to parse("|aa")
    end

    it "matches a word with pipemark contents" do
      expect(word).to parse("a|a")
    end

    it "doesn't match a empty string" do
      expect(word).to_not parse("")
    end

    it "doesn't match a word with space prefix" do
      expect(word).to_not parse(" aa")
    end

    it "doesn't match a word with space suffix" do
      expect(word).to_not parse("aa ")
    end
  end
end
