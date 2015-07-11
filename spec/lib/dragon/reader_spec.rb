require "spec_helper"

RSpec.describe Dragon::Reader do
  let(:reader) do
    described_class.new
  end

  describe "#newline" do
    let(:newline) do
      reader.newline
    end

    it "matches newline" do
      expect(newline).to parse("\n")
    end

    it "matches return" do
      expect(newline).to parse("\r")
    end
  end

  describe "#eof" do
    let(:eof) do
      reader.eof
    end

    it "matches empty" do
      expect(eof).to parse("")
    end
  end

  describe "#space" do
    let(:space) do
      reader.space
    end

    it "matches space" do
      expect(space).to parse(" ")
    end
  end

  describe "#indentation" do
    let(:indentation) do
      reader.indentation
    end

    it "matches indentation" do
      expect(indentation).to parse("  ")
    end
  end

  describe "#character" do
    let(:character) do
      reader.character
    end

    it "matches alpha character" do
      expect(character).to parse("a")
    end

    it "matches capital alpha character" do
      expect(character).to parse("A")
    end

    it "matches numeric character" do
      expect(character).to parse("1")
    end

    it "doesn't match a newline character" do
      expect(character).to_not parse("\n")
    end
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

  describe "#string" do
    let(:string) do
      reader.string
    end

    it "matches a string with one item" do
      expect(string).to parse(%|"a"|)
    end

    it "matches a string with multiple items" do
      expect(string).to parse(%|"aaa"|)
    end
  end

  describe "#definition" do
    let(:definition) do
      reader.definition
    end

    it "matches a simple numeric definition" do
      expect(definition).to parse("word: 1")
    end

    it "matches a simple string definition" do
      expect(definition).to parse("word: \"a\"")
    end

    it "matches a definition with a lookup" do
      expect(definition).to parse("word: verb()")
    end

    it "matches a definition with a lookup that has values" do
      expect(definition).to parse("word: verb( 1 , 2 )")
    end

    it "doesn't match a definition with post-colon bad spacing" do
      expect(definition).to_not parse("word :\"a\"")
    end

    it "doesn't match a definition with pre-colon bad spacing" do
      expect(definition).to_not parse("word : \"a\"")
    end
  end

  describe "#arguments" do
    let(:arguments) do
      reader.arguments
    end

    it "matches a single argument" do
      expect(arguments).to parse(" num1: 1 ")
    end

    it "matches multiple arguments" do
      expect(arguments).to parse(" num1: 1 , num2: 2 ")
    end
  end

  describe "#lookup" do
    let(:lookup) do
      reader.lookup
    end

    it "matches a lookup with no arguments" do
      expect(lookup).to parse("word()")
    end

    it "matches a lookup with a single numeric argument" do
      expect(lookup).to parse("word( num1: 1 )")
    end

    it "matches a lookup with multiple numeric arguments" do
      expect(lookup).to parse("word( num1: 1 , num2: 2 )")
    end
  end

  describe "#expression" do
    let(:expression) do
      reader.expression
    end

    it "matches definition with a lookup as the value" do
      expect(expression).to parse("word: word1()")
    end

    it "matches identation followed by lookup no arguments" do
      expect(expression).to parse("  word1()")
    end

    it "matches lookup chain with no arguments" do
      expect(expression).to parse("word1() word2()")
    end

    it "matches lookup chain with a single numeric argument" do
      expect(expression).to parse("word1( num1: 1 ) word2( num2: 2 )")
    end
  end
end
